//
//  StableValuePublisher.swift
//  
//
//  Created by Илья on 18.05.2023.
//

import Combine
import Foundation

public extension Publisher {

    private typealias OutputInfo = (value: Output, isDelay: Bool, timestamp: TimeInterval)

    /// Паблишер, который фильтрует сигналы пока не будет пауза, тогда отправляет последнее полученное значение
    /// - Parameters:
    ///   - interval: длительность ожидаемой паузы
    ///   - scheduler: поток в который высылать значение. По дефолту main
    func stableValue<S: Scheduler>(
        for interval: TimeInterval,
        scheduler: S = DispatchQueue.main
    ) -> AnyPublisher<Output, Failure> where Output: Equatable {
        self
            .delay(for: .seconds(interval), scheduler: scheduler)
            .map { value in
                (value, true)
            }
            .merge(with: self.map { value in
                (value, false)
            })
            .map { value, isDelay in
                (value, isDelay, Date().timeIntervalSinceReferenceDate)
            }
            .scan(nil) { (prevInfo: OutputInfo?, newInfo: OutputInfo) -> OutputInfo? in
                guard let prevInfo = prevInfo else {
                    return newInfo
                }

                if !newInfo.isDelay {
                    return newInfo
                }

                if newInfo.value == prevInfo.value && newInfo.timestamp >= prevInfo.timestamp + Double(interval) {
                    return newInfo
                }

                return prevInfo
            }
            .compactMap { $0 }
            .filter { $0.isDelay }
            .map { $0.value }
            .eraseToAnyPublisher()
    }
}
