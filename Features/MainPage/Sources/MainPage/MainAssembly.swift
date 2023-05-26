//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import DipCore
import UIKit

public enum MainPageAssemly {
    public static func setup() {

        Dependency.register { (output: ActionClosure?, navigationController: UINavigationController) in
            MainPageCoordinator(
                output: output,
                navigationController: navigationController,
                storage: Dependency.resolve()
            )
        }.implements(MainPageCoordinatorProtocol.self)

        Dependency.register { (actionClosure: ActionClosure?) in
            MainPage.Presenter(actionClosure: actionClosure)
        }
            .implements(MainPresenterProtcol.self)

        Dependency.register { (actionClosure: ActionClosure?) in
            MainPage.ViewController(
                presenter: Dependency.resolve(arguments: actionClosure)
            )
        }
            .implements(MainViewControllerProtocol.self)
    }
}
