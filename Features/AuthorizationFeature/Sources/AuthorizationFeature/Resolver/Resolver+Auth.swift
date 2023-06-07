//
//  Resolver+Auth.swift
//  
//
//  Created by Daniil on 31.05.2023.
//

import BaseArch
import DipCore
import SuperCore

public extension ResolverProtocol {
    func authCodeCoordinator(phone: String) -> AuthCoordinatorProtocol {
        Dependency.resolve(arguments: phone)
    }
}

extension ResolverProtocol {
    func authCodeBuilder(phone: String, actionClosure: ActionClosure?) -> AuthCodeBuilderProtocol {
        Dependency.resolve(arguments: phone, actionClosure)
    }

    func authPhoneController(actionClosure: ActionClosure?) -> AuthPhoneViewControllerProtocol {
        Dependency.resolve(arguments: actionClosure)
    }
}
