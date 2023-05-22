//
//  Optional+Extension.swift
//  Technopark
//
//  Created by Semyon Baryshev on 24.08.2021.
//  Copyright © 2021 Technopark. All rights reserved.
//

import Foundation

/// Protocol to be used instead of generic Optional type in generic where clause
public protocol OptionalType {
    associatedtype Wrapped
    var value: Wrapped? { get }
}

/// Conform Optional type to OptionalType protocol to be used in generic where clause
extension Optional: OptionalType {
    public var value: Self {
        self
    }
}

public extension Optional where Wrapped: Collection {
    var isEmptyOrNil: Bool {
        return self?.isEmpty != false
    }
}
