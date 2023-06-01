//
//  File.swift
//  
//
//  Created by Daniil on 31.05.2023.
//

import BaseArch
import DipCore

public extension ResolverProtocol {
    func tabBarCoordinator() -> TabBarCoordinatorProtocol {
        Dependency.resolve()
    }
}
