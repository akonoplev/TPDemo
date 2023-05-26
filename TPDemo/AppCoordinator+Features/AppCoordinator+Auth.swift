//
//  AppCoordinator+Auth.swift
//  TPDemo
//
//  Created by Андрей Коноплев on 24.05.2023.
//

import AuthorizationFeature
import DipCore
import BaseArch
import SuperCore
import UIKit

extension AppCoordinator {
    func showAuth(onViewController: UIViewController,
                  didAuth: VoidClosure?) {

        let coordinator: AuthCoordinatorProtocol = Dependency.resolve(
            arguments: onViewController
        )

        coordinator.output
            .sink { [weak self] action in
                guard let self = self else {
                    return
                }

                switch action {
                case .didAuth:
                    didAuth?()
                    self.removeCoordinator(coordinator)
                case .didFinish:
                    self.removeCoordinator(coordinator)
                case .showCatalogFlow:
                    self.showCatalog
                }
            }.store(in: &subscriptions)

        startCoordinator(coordinator)
    }
}
