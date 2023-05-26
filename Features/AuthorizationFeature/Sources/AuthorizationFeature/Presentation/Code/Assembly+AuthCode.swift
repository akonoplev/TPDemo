//
//  Assembly+AuthCode.swift
//  
//
//  Created by Daniil on 26.05.2023.
//

import BaseArch
import DipCore

extension Assembly {
    func registerAuthCode() {
        Dependency.register { (actionClosure: ActionClosure?) in
            AuthCodePresenter(actionClosure: actionClosure)
        }
            .implements(AuthCodePresenterProtcol.self)

        Dependency.register { (actionClosure: ActionClosure?) in
            AuthCodeViewController(
                presenter: Dependency.resolve(arguments: actionClosure)
            )
        }
            .implements(AuthCodeViewControllerProtocol.self)

    }
}
