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
            AuthCoordinator(assembly: self, context: $0, storage: Dependency.resolve())
        }
            .implements(AuthCoordinatorProtocol.self)

        Dependency.register { [unowned self] (context: Auth.Code.Context, actionClosure: ActionClosure?) in
            Auth.Code.Builder(
                context: context,
                resolver: self.resolver,
                actionClosure: actionClosure
            )
        }
            .implements(AuthCodeBuilderProtocol.self)
    }

    private func registerAuthPhone() {

        Dependency.register { (actionClosure: ActionClosure?) in
            Auth.Phone.Presenter(actionClosure: actionClosure)
        }
            .implements(AuthPhonePresenterProtocol.self)

        Dependency.register { (actionClosure: ActionClosure?) in
            Auth.Phone.ViewController(
                presenter: Dependency.resolve(arguments: actionClosure)
            )
        }
            .implements(AuthPhoneViewControllerProtocol.self)
    }
}
