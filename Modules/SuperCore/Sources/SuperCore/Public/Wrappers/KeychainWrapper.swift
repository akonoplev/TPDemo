//
//  KeychainWrapper.swift
//  Technopark
//
//  Created by Андрей Коноплев on 07.02.2023.
//

import KeychainAccess
import SwiftUI

@propertyWrapper
public struct KeychainStorage<T: Codable>: DynamicProperty {

    public typealias Value = T
    @State private var value: Value?

    public var wrappedValue: Value? {
        get { value }
        nonmutating set {
            value = newValue
            do {
                let encoded = try JSONEncoder().encode(newValue)
                try Keychain().set(encoded, key: key)
            } catch {
                print("Keychain access failed by \(key)")
                try? Keychain().remove(key)
            }
        }
    }

    public var projectedValue: Binding<Value?> {
        Binding(get: { wrappedValue }, set: { wrappedValue = $0 })
    }

    public let key: String

    public init(wrappedValue: Value? = nil, _ key: String) {
        self.key = key
        var initialValue = wrappedValue

        do {
            try Keychain().get(key) { attributes in
                if let attributes = attributes,
                   let data = attributes.data {
                    do {
                        let decoded = try JSONDecoder().decode(Value.self, from: data)
                        initialValue = decoded
                    } catch {
                        print("[KeychainStorage] Keychain().get(\(key)) - \(error.localizedDescription)")
                    }
                }
            }
        } catch {
            print("\(error)")
        }
        self._value = State<Value?>(initialValue: initialValue)
    }
}
