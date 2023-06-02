//
//  Resolver+Profile.swift
//  
//
//  Created by Daniil on 01.06.2023.
//

import BaseArch
import DipCore

public extension ResolverProtocol {
    func profileCoordinator(name: String) -> ProfileCoordinatorProtocol {
        Dependency.resolve(arguments: name)
    }
}

extension ResolverProtocol {
    func profileBuilder(name: String, actionClosure: ActionClosure?) -> ProfileBuilderProtocol {
        Dependency.resolve(arguments: name, actionClosure)
    }
}
