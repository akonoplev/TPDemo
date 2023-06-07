//
//  AuthCodeCoordinator.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import DipCore
import SuperCore
import UIKit

public protocol AuthCoordinatorProtocol {
    var anyCoordinator: AnyCoordinator<UINavigationController> { get }
}

final class AuthCoordinator: NavigationCoordinator<Assembly, AuthCoordinator.Context>, AuthCoordinatorProtocol {
    struct Context {
        let phone: String
    }
    
    deinit {
        print("some shit")
    }

    override func start() {
        guard let assembly = assembly else {
            return
        }

        let actionClosure: ActionClosure? = { [weak self] action in
            self?.handleModuleAction(action: action) { [weak self] (action: AuthCodeAction, _) in
                guard let self = self else {
                    return
                }

                switch action {
                case .didAuth:
                    self.finish?(nil)
                case .changePhone:
                    self.showPhoneAuth()
                }
            }
        }

        set(
            viewControllers: [assembly.resolver.authCodeBuilder(phone: context.phone, actionClosure: actionClosure).build()],
            animated: false
        )
    }

    private func showPhoneAuth() {
        guard let assembly = assembly else {
            return
        }

        let actionClosure: ActionClosure? = { [weak self] _ in }

        push(viewController: assembly.resolver.authPhoneController(actionClosure: actionClosure), animated: true)
    }
}
