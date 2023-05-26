//
//  File.swift
//  
//
//  Created by Daniil on 26.05.2023.
//

import BaseArch
import DipCore

extension Assembly {
    func registerMain() {
        Dependency.register {
            MainCoordinator(assembly: self, storage: Dependency.resolve())
        }
            .implements(MainCoordinatorProtocol.self)

        Dependency.register { (actionClosure: ActionClosure?) in
            MainPresenter(actionClosure: actionClosure)
        }
            .implements(MainPresenterProtcol.self)

        Dependency.register { (actionClosure: ActionClosure?) in
            MainViewController(
                presenter: Dependency.resolve(arguments: actionClosure)
            )
        }
            .implements(MainViewControllerProtocol.self)
    }
}
