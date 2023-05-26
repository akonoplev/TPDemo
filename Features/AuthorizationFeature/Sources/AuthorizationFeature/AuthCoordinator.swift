//
//  AuthCoordinator.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import DipCore
import UIKit

public protocol AuthCoordinatorProtocol {
    var anyCoordinator: AnyCoordinator<UINavigationController> { get }
}

final class AuthCoordinator: NavigationCoordinator<Assembly, BaseCoordinatorContext>, AuthCoordinatorProtocol {

    override func make() -> UIViewController? {
        let actionClosure: ActionClosure? = { [weak self] _ in }

        let authViewController: AuthCodeViewControllerProtocol = Dependency.resolve(arguments: actionClosure)
        
        return authViewController
    }
}
