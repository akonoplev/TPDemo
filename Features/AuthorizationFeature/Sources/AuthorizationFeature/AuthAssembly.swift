//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import DipCore

public enum AuthAssembly {
    public static func setup() {
        Dependency.register { (actionClosure: ActionClosure?) in
            AuthPresenter(actionClosure: actionClosure)
        }
            .implements(AuthPresenterProtcol.self)

        Dependency.register { (actionClosure: ActionClosure?) in
            AuthViewController(
                presenter: Dependency.resolve(arguments: actionClosure)
            )
        }
            .implements(AuthViewControllerProtocol.self)

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