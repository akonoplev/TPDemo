//
//  MainCoordinator.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import DipCore
import UIKit

public protocol MainCoordinatorProtocol {
    var anyCoordinator: AnyCoordinator<UINavigationController> { get }
}

final class MainCoordinator: NavigationCoordinator<Assembly, BaseCoordinatorContext>, MainCoordinatorProtocol {
    override func start() {
        guard let assembly = assembly else {
            return
        }

        let actionClosure: ActionClosure? = { [weak self] action in
            self?.handleModuleAction(action: action) { (action: MainAction, _) in
                switch action {
                case .showCodeAuth:
                    self?.showAuth()
                case .pushAuth:
                    self?.showPhoneAuth()
                }
            }
        }

        set(viewControllers: [assembly.resolver.mainController(actionClosure: actionClosure)], animated: false)
    }

    private func showAuth() {
        guard let assembly = assembly else {
            return
        }
        present(
            coordinator: assembly.outputRoutes.fullScreenAuthCoordinator(),
            rootController: UINavigationController(),
            animated: true
        )
    }

    private func showPhoneAuth() {
        guard let assembly = assembly else {
            return
        }

        push(coordinator: assembly.outputRoutes.fullScreenAuthCoordinator(), animated: true)
    }
}
