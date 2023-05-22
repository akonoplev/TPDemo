//
//  StorageWrapper.swift
//  Technopark
//
//  Created by Владислав Афанасьев on 14.05.2021.
//  Copyright © 2021 Technopark. All rights reserved.
//

import Combine
import Foundation

@propertyWrapper
public struct StorageWrapper<T: Codable> {
    private let key: String
    private let defaultValue: T
    private let userDefaults: UserDefaults
    private let valueSubject: CurrentValueSubject<T, Never>

    public init(key: String, defaultValue: T, userDefaults: UserDefaults) {
        self.key = key
        self.defaultValue = defaultValue
        self.userDefaults = userDefaults
        self.valueSubject = CurrentValueSubject<T, Never>(defaultValue)

        valueSubject.value = wrappedValue
    }

    public var projectedValue: AnyPublisher<T, Never> {
        valueSubject.eraseToAnyPublisher()
    }

    // The use of an array is necessary for iOS 12
    // since it is impossible to encode the values of the first level
    // https://drewag.me/posts/2019/09/11/json-encoder-change-in-swift-5
    public var wrappedValue: T {
        get {
            switch T.self {
            case is Bool.Type:
                if userDefaults.object(forKey: key) == nil {
                    return defaultValue
                }

                return (userDefaults.bool(forKey: key) as? T) ?? defaultValue
            default:
                guard let data = userDefaults.object(forKey: key) as? Data else {
                    return defaultValue
                }

                let arrayValue = try? JSONDecoder().decode([T].self, from: data)
                let value = try? JSONDecoder().decode(T.self, from: data)
                return arrayValue?.first ?? value ?? defaultValue
            }
        }
        set {
            switch T.self {
            case is Bool.Type:
                userDefaults.set(newValue, forKey: key) // fot back compatibility
            default:
                let data = try? JSONEncoder().encode([newValue])
                userDefaults.set(data, forKey: key)
            }

            valueSubject.value = newValue
        }
    }
}
