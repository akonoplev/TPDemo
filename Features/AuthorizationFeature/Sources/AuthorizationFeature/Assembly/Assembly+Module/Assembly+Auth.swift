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
            AuthCodeCoordinator(assembly: self, context: .init(phone: $0, finish: $1), storage: Dependency.resolve())
        }
            .implements(AuthCodeCoordinatorProtocol.self)

        Dependency.register { [unowned self] (phone: String, finish: @escaping VoidClosure, actionClosure: ActionClosure?) in
            AuthCodeBuilder(
                context: .init(phone: phone, finish: finish),
                resolver: self.resolver,
                actionClosure: actionClosure
            )
        }
            .implements(AuthCodeBuilderProtocol.self)
    }

    private func registerAuthPhone() {
        Dependency.register {
            AuthPhoneCoordinator(assembly: self, storage: Dependency.resolve())
        }
            .implements(AuthPhoneCoordinatorProtocol.self)

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
