//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import DipCore
import UIKit

public enum MainAssemly {
    public static func setup(rootController: UIViewController){
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

        Dependency.register {
            MainCoordinator(storage: Dependency.resolve(),
                                                  rootViewController: rootController)
        }
        .implements(MainCoordinatorProtocol.self)
    }
}
