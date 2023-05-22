//
//  PassiveCombinePublisher.swift
//  Technopark
//
//  Created by Илья on 16.09.2022.
//

import Combine

/// Объединяет исходящие данные в единный поток данных в формате кортежа из данных потоков источников.
/// Работает аналогичном способом как и combineLatet, отличие в том что данный паблишер передает данные только
/// при получении данных с первого паблишера источника.
public struct PassiveCombinePublisher<P1, P2>: Publisher where P1: Publisher, P2: Publisher, P1.Failure == P2.Failure {
    public typealias Output = (P1.Output, P2.Output)
    public typealias Failure = P1.Failure

    private let publisher1: P1
    private let publisher2: P2

    init(publisher1: P1, publisher2: P2) {
        self.publisher1 = publisher1
        self.publisher2 = publisher2
    }

    class PassiveCombineSubscription<S>: Subscription where S: Subscriber, P1.Failure == S.Failure, (P1.Output, P2.Output) == S.Input {
        private var pub1subscription: Subscription?
        private var pub2subscription: Subscription?

        private var pentUp: Subscribers.Demand = .none

        private var pub1Value: P1.Output?
        private var pub2Value: P2.Output?
        private let subscriber: S

        init(
            publisher1: P1,
            publisher2: P2,
            subscriber: S
        ) {
            self.subscriber = subscriber

            let subscriber1 = AnySubscriber<P1.Output, P1.Failure>(
                receiveSubscription: { [weak self] in
                    self?.pub1subscription = $0
                },
                receiveValue: { value in
                    self.pub1Value = value
                    return self.sendValues()
                },
                receiveCompletion: { [weak self] completion in
                    switch completion {
                    case .finished:
                        subscriber.receive(completion: .finished)
                    case .failure:
                        subscriber.receive(completion: completion)
                    }

                    self?.cancel()
                })

            let subscriber2 = AnySubscriber<P2.Output, P2.Failure>(
                receiveSubscription: { [weak self] in
                    self?.pub2subscription = $0
                },
                receiveValue: { value in
                    self.pub2Value = value
                    self.sendValues()
                    return .unlimited
                },
                receiveCompletion: { [weak self] completion in
                    guard let self = self else {
                        return
                    }

                    switch completion {
                    case .finished:
                        if self.pub2Value == nil {
                            subscriber.receive(completion: .finished)
                            self.cancel()
                        }
                    case .failure:
                        subscriber.receive(completion: completion)
                        self.cancel()
                    }
                })

            publisher1.receive(subscriber: subscriber1)
            publisher2.receive(subscriber: subscriber2)
        }

        func request(_ demand: Subscribers.Demand) {
            switch demand {
            case .unlimited:
                pentUp = .unlimited
            case .none:
                pentUp = .none
            default:
                pentUp += demand
            }

            requestFromNext()
            pub2subscription?.request(.unlimited)
        }

        func cancel() {
            self.pub1subscription = nil
            self.pub2subscription = nil
        }

        @discardableResult
        private func sendValues() -> Subscribers.Demand {
            if let pub1Value = pub1Value, let pub2Value = pub2Value {
                self.pub1Value = nil
                _ = subscriber.receive((pub1Value, pub2Value))
            }

            requestFromNext()
            return pentUp
        }

        private func requestFromNext() {
            guard let subscription = pub1subscription else {
                return
            }

            switch pentUp {
            case .none:
                break
            default:
                pentUp -= 1
                subscription.request(.max(1))
            }
        }
    }

    public func receive<S>(subscriber: S) where S: Subscriber, P1.Failure == S.Failure, (P1.Output, P2.Output) == S.Input {
        let subscription = PassiveCombineSubscription(
            publisher1: self.publisher1,
            publisher2: self.publisher2,
            subscriber: subscriber)
        subscriber.receive(subscription: subscription)
    }
}

public extension Publisher {
    /// Объединяет исходящие данные в единный поток данных в формате кортежа из данных потоков источников.
    /// Работает аналогичном способом как и combineLatet, отличие в том что данный паблишер передает данные только
    /// при получении данных с первого паблишера источника.
    func passiveCombine<P>(
        with publisher: P
    ) -> AnyPublisher<(Output, P.Output), Failure> where P: Publisher, P.Failure == Failure {
        return PassiveCombinePublisher(publisher1: self, publisher2: publisher).eraseToAnyPublisher()
    }
}
