//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import DipCore

public enum MainAssemly {
    public static func setup() {
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
