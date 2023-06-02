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
    func authCodeCoordinator(phone: String, finish: @escaping VoidClosure) -> AuthCoordinatorProtocol {
        Dependency.resolve(arguments: phone, finish)
    }
}

extension ResolverProtocol {
    func authCodeBuilder(phone: String, finish: @escaping VoidClosure, actionClosure: ActionClosure?) -> AuthCodeBuilderProtocol {
        Dependency.resolve(arguments: phone, finish, actionClosure)
    }

    func authPhoneController(actionClosure: ActionClosure?) -> AuthPhoneViewControllerProtocol {
        Dependency.resolve(arguments: actionClosure)
    }
}
