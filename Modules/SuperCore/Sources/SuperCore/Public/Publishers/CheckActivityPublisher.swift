//
//  CheckActivityPublisher.swift
//  
//
//  Created by Илья on 18.04.2023.
//

import Combine

private protocol CheckActivitySubscriptionProtocol {
    var isActive: Bool { get }
}

/// Паблишер который запоминает подписки. Может возвращать флаг, есть ли активные подписки на этот паблишер
public class CheckActivityPublisher<Output, Failure: Error>: Publisher {

    public var isActive: Bool {
        subscriptionList.contains(where: { $0.isActive })
    }

    private let publisher: AnyPublisher<Output, Failure>
    private var subscriptionList: [CheckActivitySubscriptionProtocol] = []

    init<P: Publisher>(publisher: P) where P.Output == Output, P.Failure == Failure {
        self.publisher = publisher.eraseToAnyPublisher()
    }

    class CheckActivitySubscription<S>: Subscription, CheckActivitySubscriptionProtocol
        where S: Subscriber, Failure == S.Failure, Output == S.Input {

        private var pubSubscription: Subscription?
        private let subscriber: S

        var isActive: Bool {
            pubSubscription != nil
        }

        init(
            publisher: AnyPublisher<Output, Failure>,
            subscriber: S
        ) {
            self.subscriber = subscriber

            let subscriber = AnySubscriber<Output, Failure>(
                receiveSubscription: { [weak self] in
                    self?.pubSubscription = $0
                },
                receiveValue: { value in
                    subscriber.receive(value)
                },
                receiveCompletion: { [weak self] completion in
                    subscriber.receive(completion: completion)
                    self?.cancel()
                })

            publisher.receive(subscriber: subscriber)
        }

        func request(_ demand: Subscribers.Demand) {
            pubSubscription?.request(demand)
        }

        func cancel() {
            self.pubSubscription = nil
        }
    }

    public func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, Output == S.Input {
        let subscription = CheckActivitySubscription(
            publisher: self.publisher,
            subscriber: subscriber)
        subscriber.receive(subscription: subscription)
        subscriptionList.append(subscription)
    }
}

public extension Publisher {
    /// Объединяет исходящие данные в единный поток данных в формате кортежа из данных потоков источников.
    /// Работает аналогичном способом как и combineLatet, отличие в том что данный паблишер передает данные только
    /// при получении данных с первого паблишера источника.
    func checkActivity() -> CheckActivityPublisher<Output, Failure> {
        return CheckActivityPublisher(publisher: self)
    }
}
