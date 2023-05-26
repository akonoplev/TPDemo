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

        let mainController: MainViewControllerProtocol = Dependency.resolve(arguments: actionClosure)

        return mainController
    }

    private func showAuth() {
        guard let coordinator = assembly?.outputRoutes.authCoordinator() else {
            return
        }

        start(coordinator: coordinator, container: root, animated: true)
    }
}
