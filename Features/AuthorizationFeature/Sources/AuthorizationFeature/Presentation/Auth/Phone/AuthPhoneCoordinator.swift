//
//  AuthPhoneCoordinator.swift
//  
//
//  Created by Daniil on 31.05.2023.
//

import BaseArch
import DipCore
import UIKit

public protocol AuthPhoneCoordinatorProtocol {
    var anyCoordinator: AnyCoordinator<UINavigationController> { get }
}

final class AuthPhoneCoordinator: NavigationCoordinator<Assembly, BaseCoordinatorContext>, AuthPhoneCoordinatorProtocol {
    override func make() -> UIViewController? {
        guard let assembly = assembly else {
            return nil
        }

        let actionClosure: ActionClosure? = { [weak self] _ in }

        return assembly.resolver.authPhoneController(actionClosure: actionClosure)
    }
}
