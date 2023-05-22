//
//  AnimateViewPublisher.swift
//  Technopark
//
//  Created by Илья on 20.03.2023.
//

import Combine
import UIKit

public extension Publisher {

    /// Подписание на паблишер с возможной анимацией вьюшек. При наличии флага анимации изменения выполняются в блоке UIView.animate
    /// - Parameters:
    ///   - isAnimatePublisher: паблишер флага необходимости анимации
    ///   - animateDuration: длительность анимации
    ///   - handler: блок изменений при
    /// - Returns: объект подписки
    func viewAnimateSink<T: Publisher>(
        isAnimatePublisher: T,
        animateDuration: TimeInterval,
        handler: @escaping (Output) -> Void
    ) -> AnyCancellable where T.Output == Bool, T.Failure == Failure {
        combineLatest(isAnimatePublisher)
            .sink(receiveValue: { value, isAnimate in
                if isAnimate {
                    UIView.animate(withDuration: animateDuration) {
                        handler(value)
                    }
                } else {
                    handler(value)
                }
            })
    }

    /// Подписание на паблишер с возможной анимацией вьюшек. При наличии флага анимации изменения выполняются в блоке UIView.animate
    /// - Parameters:
    ///   - isAnimatePublisher: паблишер флага необходимости анимации
    ///   - animateDuration: длительность анимации
    ///   - keyPath: изменяемый параметр объекта
    ///   - object: объект подвергаемый изменениям
    /// - Returns: объект подписки
    func viewAnimateAssign<T: Publisher, Root>(
        isAnimatePublisher: T,
        animateDuration: TimeInterval,
        to keyPath: ReferenceWritableKeyPath<Root, Self.Output>,
        on object: Root
    ) -> AnyCancellable where T.Output == Bool, T.Failure == Failure {
        passiveCombine(with: isAnimatePublisher)
            .sink(receiveValue: { value, isAnimate in
                if isAnimate {
                    UIView.animate(withDuration: animateDuration) {
                        object[keyPath: keyPath] = value
                    }
                } else {
                    object[keyPath: keyPath] = value
                }
            })
    }
}
