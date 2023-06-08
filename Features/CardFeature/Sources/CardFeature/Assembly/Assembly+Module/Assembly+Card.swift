//
//  File.swift
//  
//
//  Created by Daniil on 26.05.2023.
//

import BaseArch
import DipCore

extension Assembly {
    func registerCard() {
        Dependency.register {
            CardCoordinator(assembly: self, storage: Dependency.resolve())
        }
            .implements(CardCoordinatorProtocol.self)

        Dependency.register { (actionClosure: ActionClosure?) in
            CardPresenter(actionClosure: actionClosure)
        }
            .implements(CardPresenterProtcol.self)

        Dependency.register { (actionClosure: ActionClosure?) in
            CardViewController(
                presenter: Dependency.resolve(arguments: actionClosure)
            )
        }
            .implements(CardViewControllerProtocol.self)
    }
}
