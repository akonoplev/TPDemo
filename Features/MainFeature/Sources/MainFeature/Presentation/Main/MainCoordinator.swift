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
    override func make() -> UIViewController? {
        let actionClosure: ActionClosure? = { [weak self] action in
            self?.handleModuleAction(action: action) { (action: MainAction, _) in
                switch action {
                case .didTapToButton:
                    self?.showAuth()
                }
            }
        }

        return assembly?.resolver.mainController(actionClosure: actionClosure)
    }

    private func showAuth() {
        guard let assembly = assembly else {
            return
        }

        let rootController = UINavigationController()
        let coordinator = assembly.outputRoutes.authCoordinator(finish: { [weak rootController] in
            rootController?.dismiss(animated: true)
        })

        present(coordinator: coordinator, rootController: rootController, animated: true)
    }
}
