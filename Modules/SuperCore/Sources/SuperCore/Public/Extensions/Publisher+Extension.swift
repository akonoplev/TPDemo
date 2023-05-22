//
//  Publisher+Extension.swift
//  Technopark
//
//  Created by Semyon Baryshev on 24.08.2021.
//  Copyright © 2021 Technopark. All rights reserved.
//

import Combine
import Foundation

public extension Publisher {
    /// Transforms all elements from the upstream publisher to Void type
    func mapToVoid() -> Publishers.Map<Self, Void> {
        map { _ in () }
    }
}

public extension Publisher where Self.Output: OptionalType {
    /// Publishes only non-nil elements from the upstream, transforming Optional output type to non-Optional
    func filterNil() -> Publishers.CompactMap<Self, Self.Output.Wrapped> {
        compactMap(\.value)
    }
}

public extension Publisher {
    func stopAfter<S>(
        _ interval: S.SchedulerTimeType.Stride,
        tolerance: S.SchedulerTimeType.Stride? = nil,
        scheduler: S,
        options: S.SchedulerOptions? = nil
    ) -> AnyPublisher<Output, Failure> where S: Scheduler {
        let delayPublisher = Just(()).delay(for: interval, tolerance: tolerance, scheduler: scheduler, options: nil)
        return prefix(untilOutputFrom: delayPublisher).eraseToAnyPublisher()
    }

    func replaceErrorWithNil() -> AnyPublisher<Output?, Never> {
        return map { $0 as Output? }.replaceError(with: nil).eraseToAnyPublisher()
    }
}

public extension Publisher {
    /// Преобразует данные в картеж данных с текущим и предыдущем значением.
    /// Первое значение выводится с переданным дефолтным значением в качестве предыдущего значения.
    func withPreviousValue(initialValue: Output) -> AnyPublisher<(from: Output, to: Output), Failure> {
        return self
            .scan((initialValue, initialValue)) { ($0.1, $1) }
            .eraseToAnyPublisher()
    }

    /// Преобразует данные в картеж данных с текущим и предыдущем значением.
    /// Первое значение выводится со значение nil в качестве предыдущего значения.
    func withPreviousValue() -> AnyPublisher<(from: Output?, to: Output), Failure> {
        let startValue: (Output?, Output?) = (nil, nil)
        return self
            .scan(startValue) { ($0.1, $1) }
            .compactMap {
                guard let newValue = $0.1 else {
                    return nil
                }
                return ($0.0, newValue)
            }
            .eraseToAnyPublisher()
    }
}

public extension Publisher {
    func arrayMap<ElementInput, ElementOutput>(
        _ transform: @escaping (ElementInput) -> ElementOutput
    ) -> Publishers.Map<Self, [ElementOutput]> where Output == [ElementInput] {
        self.map {
            $0.map(transform)
        }
    }

    func arrayMap<ElementInput, AddInput, ElementOutput>(
        _ transform: @escaping (ElementInput, AddInput) -> ElementOutput
    ) -> Publishers.Map<Self, [ElementOutput]> where Output == ([ElementInput], AddInput) {
        self.map { modelList, addInput in
            modelList.map {
                transform($0, addInput)
            }
        }
    }

    func arrayCompactMap<ElementInput, ElementOutput>(
        _ transform: @escaping (ElementInput) -> ElementOutput?
    ) -> Publishers.Map<Self, [ElementOutput]> where Output == [ElementInput] {
        self.map {
            $0.compactMap(transform)
        }
    }

    func arrayCompactMap<ElementInput, AddInput, ElementOutput>(
        _ transform: @escaping (ElementInput, AddInput) -> ElementOutput?
    ) -> Publishers.Map<Self, [ElementOutput]> where Output == ([ElementInput], AddInput) {
        self.map { modelList, addInput in
            modelList.compactMap {
                transform($0, addInput)
            }
        }
    }

    /// Преобразование выходных данных паблишера из массива массивов элемнтов в раскрытый массив элементов (аналогично стандартному flatMap)
    func arrayFlatMap<ElementInput, ElementOutput>(
        _ transform: @escaping (ElementInput) -> [ElementOutput]
    ) -> Publishers.Map<Self, [ElementOutput]> where Output == [ElementInput] {
        self.map { list -> [ElementOutput] in
            list.flatMap(transform)
        }
    }

    func arrayFilter<Element>(
        _ filter: @escaping (Element) -> Bool
    ) -> Publishers.Map<Self, [Element]> where Output == [Element] {
        self.map {
            $0.filter(filter)
        }
    }
}

public extension Publisher {
    /// Перобразование опционального элемента через хэндлер преобразования при наличии значения
    func optionalMap<In, Out>(
        _ transform: @escaping (In) -> Out
    ) -> Publishers.Map<Self, Out?> where Output == In? {
        self.map { input -> Out? in
            if let input = input {
                return transform(input)
            } else {
                return nil
            }
        }
    }
}

public extension Publisher {
    /// Добавляет к данным индекс получаемых данных
    func addIndex() -> AnyPublisher<(Output, Int), Failure> {
        scan((Output?.none, 0)) { info, value in
            if info.0 == nil {
                return (value, 0)
            } else {
                return (value, info.1 + 1)
            }
        }
        .compactMap { info in
            guard let value = info.0 else {
                return nil
            }
            return (value, info.1)
        }
        .eraseToAnyPublisher()
    }

    /// Добавляет к данным получаемых данных является ли это первым сигналом
    func addFirstFlag() -> AnyPublisher<(Output, Bool), Failure> {
        scan((Output?.none, true)) { info, value in
            if info.0 == nil {
                return (value, true)
            } else {
                return (value, false)
            }
        }
        .compactMap { info in
            guard let value = info.0 else {
                return nil
            }
            return (value, info.1)
        }
        .eraseToAnyPublisher()
    }
}
