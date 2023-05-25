//
//  CoreCoordinator+AnyCoordinator.swift
//  
//
//  Created by Daniil on 25.05.2023.
//

import Foundation

public extension CoreCoordinator {
    var anyCoordinator: AnyCoordinator<Root> {
        .init(self)
    }
}
