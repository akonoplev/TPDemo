//
//  AuthAssembly.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import DipCore
import SuperCore

extension Assembly {
    func registerAuth() {
        registerAuthCode()
        registerAuthPhone()
    }

    private func registerAuthCode() {
        Dependency.register {
            AuthCoordinator(assembly: self, context: .init(phone: $0), storage: Dependency.resolve())
        }
            .implements(AuthCoordinatorProtocol.self)

        Dependency.register { [unowned self] (phone: String, actionClosure: ActionClosure?) in
            AuthCodeBuilder(
                context: .init(phone: phone),
                resolver: self.resolver,
                actionClosure: actionClosure
            )
        }
            .implements(AuthCodeBuilderProtocol.self)
    }

    private func registerAuthPhone() {

        Dependency.register { (actionClosure: ActionClosure?) in
            AuthPhonePresenter(actionClosure: actionClosure)
        }
            .implements(AuthPhonePresenterProtocol.self)

        Dependency.register { (actionClosure: ActionClosure?) in
            AuthPhoneViewController(
                presenter: Dependency.resolve(arguments: actionClosure)
            )
        }
            .implements(AuthPhoneViewControllerProtocol.self)
    }
}
