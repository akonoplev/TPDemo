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
        print("Auth coordinator was deinited")
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
                    self.finish?(nil)
                case .changePhone:
                    self.showPhoneAuth()
                }
            }
        }

        let codeContext: Auth.Code.Context
        switch context.presentType {
        case let .bottomSheet(sheetType):
            codeContext = Auth.Code.Context(title: sheetType.title, phone: context.phone)
        case .fullScreen:
            codeContext = Auth.Code.Context(title: nil, phone: context.phone)
        }

        set(
            viewControllers: [assembly.resolver.authCodeBuilder(
                context: codeContext,
                actionClosure: actionClosure
            ).build()],
            animated: false
        )
    }

    private func showPhoneAuth() {
        guard let assembly = assembly else {
            return
        }

        let actionClosure: ActionClosure? = { [weak self] action in
            self?.handleModuleAction(action: action) { [weak self] (action: Auth.Phone.Action, _) in
                guard let self = self else {
                    return
                }

                switch action {
                case .back:
                    self.pop(animated: true)
                }
            }
        }

        push(viewController: assembly.resolver.authPhoneController(actionClosure: actionClosure), animated: true)
    }
}
