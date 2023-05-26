//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import DipCore
import UIKit

public enum AuthAssembly {
    public static func setup() {

        Dependency.register { (parentViewController: UIViewController) in
            AuthCoordinator(
                presentViewController: parentViewController,
                storage: Dependency.resolve()
            )
        }.implements(AuthCoordinatorProtocol.self)

        Dependency.register { (actionClosure: ActionClosure?) in
            Auth.Phone.Presenter(actionClosure: actionClosure)
        }
            .implements(AuthPresenterProtcol.self)

        Dependency.register { (actionClosure: ActionClosure?) in
            Auth.Phone.ViewController(
                presenter: Dependency.resolve(arguments: actionClosure)
            )
        }
            .implements(AuthViewControllerProtocol.self)

        Dependency.register { (context: Auth.Code.Context, actionClosure: ActionClosure?) in
            Auth.Code.Builder(
                context: context,
                service1: Dependency.resolve(),
                service2: Dependency.resolve(),
                actionClosure: actionClosure
            )
        }.implements(AuthCodeBuilderProtocol.self)
    }
}
