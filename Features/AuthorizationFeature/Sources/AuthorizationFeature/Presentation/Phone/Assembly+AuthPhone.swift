//
//  Assembly+AuthPhone.swift
//  
//
//  Created by Daniil on 26.05.2023.
//

import BaseArch
import DipCore

extension Assembly {
    func registerAuthPhone() {
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
