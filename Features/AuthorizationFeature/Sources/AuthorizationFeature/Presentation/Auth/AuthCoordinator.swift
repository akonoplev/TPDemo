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

final class AuthCoordinator: NavigationCoordinator<Assembly, AuthContext>, AuthCoordinatorProtocol {
    
    deinit {
        print("some shit")
    }

    override func start() {
        guard let assembly = assembly else {
            return
        }

        let actionClosure: ActionClosure? = { [weak self] action in
            self?.handleModuleAction(action: action) { [weak self] (action: Auth.Code.Action, _) in
                guard let self = self else {
                    return
                }
                
                switch action {
                case .didAuth:
                    self.context.finish()
                case .changePhone:
                    self.showPhoneAuth()
                }
            }
        }

        let context = Auth.Code.Context(phone: context.phone)
        set(
            viewControllers: [assembly.resolver.authCodeBuilder(
                context: context,
                actionClosure: actionClosure
            ).build()],
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
