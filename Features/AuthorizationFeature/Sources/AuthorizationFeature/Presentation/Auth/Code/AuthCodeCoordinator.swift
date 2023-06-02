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

public protocol AuthCodeCoordinatorProtocol {
    var anyCoordinator: AnyCoordinator<UINavigationController> { get }
}

final class AuthCodeCoordinator: NavigationCoordinator<Assembly, AuthCodeCoordinator.Context>, AuthCodeCoordinatorProtocol {
    struct Context {
        let phone: String
        let finish: VoidClosure
    }

    deinit {
        print("xxxxx")
    }

    override func make() -> UIViewController? {
        guard let assembly = assembly else {
            return nil
        }

        let actionClosure: ActionClosure? = { [weak self] action in
            self?.handleModuleAction(action: action) { [weak self] (action: AuthCodeAction, _) in
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

        return assembly.resolver.authCodeBuilder(phone: context.phone, finish: context.finish, actionClosure: actionClosure).build()
    }

    private func showPhoneAuth() {
        guard let assembly = assembly else {
            return
        }

        let actionClosure: ActionClosure? = { [weak self] _ in }

        push(viewController: assembly.resolver.authPhoneController(actionClosure: actionClosure), animated: true)
    }
}
