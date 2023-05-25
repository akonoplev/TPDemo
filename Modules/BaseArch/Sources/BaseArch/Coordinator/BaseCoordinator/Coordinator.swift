//
//  Coordinator.swift
//  
//
//  Created by Daniil on 25.05.2023.
//

import UIKit

// MARK: - Coordinator

public protocol Coordinator: AnyObject {
    func isEqual(other: Coordinator) -> Bool
}

public extension Coordinator {
    func isEqual(other: Coordinator) -> Bool {
        self === other
    }
}
