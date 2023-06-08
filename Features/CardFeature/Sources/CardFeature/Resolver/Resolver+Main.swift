//
//  File.swift
//  
//
//  Created by Daniil on 31.05.2023.
//

import BaseArch
import DipCore

public extension ResolverProtocol {
    func cardCoordinator() -> CardCoordinatorProtocol {
        Dependency.resolve()
    }
}

extension ResolverProtocol {
    func cardController(actionClosure: ActionClosure?) -> CardViewControllerProtocol {
        Dependency.resolve(arguments: actionClosure)
    }
}
