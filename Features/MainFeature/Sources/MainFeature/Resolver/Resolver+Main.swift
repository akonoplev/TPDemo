//
//  File.swift
//  
//
//  Created by Daniil on 31.05.2023.
//

import BaseArch
import DipCore

public extension ResolverProtocol {
    func mainCoordinator() -> MainCoordinatorProtocol {
        Dependency.resolve()
    }
}

extension ResolverProtocol {
    func mainController(actionClosure: ActionClosure?) -> MainViewControllerProtocol {
        Dependency.resolve(arguments: actionClosure)
    }
}
