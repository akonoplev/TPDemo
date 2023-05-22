//
//  Atomic.swift
//  Technopark
//
//  Created by Semyon Baryshev on 03.08.2021.
//  Copyright © 2021 Technopark. All rights reserved.
//

import Foundation

@propertyWrapper
public struct Atomic<Value> {
    private var value: Value
    private let lock = NSLock()

    public init(wrappedValue value: Value) {
        self.value = value
    }

    public var wrappedValue: Value {
      get {
          read()
      }
      set {
          write(newValue)
      }
    }

    func read() -> Value {
        defer {
            lock.unlock()
        }
        lock.lock()
        return value
    }

    mutating func write(_ newValue: Value) {
        defer {
            lock.unlock()
        }
        lock.lock()
        value = newValue
    }
}
