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

    func authCodeCoordinator(phone: String, presentType: PresentType) -> AuthCoordinatorProtocol {
        Dependency.resolve(arguments: AuthContext(phone: phone, presentType: presentType))
    }
}

extension ResolverProtocol {

    func authCodeBuilder(context: Auth.Code.Context, actionClosure: ActionClosure?) -> AuthCodeBuilderProtocol {
        Dependency.resolve(arguments: context, actionClosure)
    }

    func authPhoneController(actionClosure: ActionClosure?) -> AuthPhoneViewControllerProtocol {
        Dependency.resolve(arguments: actionClosure)
    }
}
