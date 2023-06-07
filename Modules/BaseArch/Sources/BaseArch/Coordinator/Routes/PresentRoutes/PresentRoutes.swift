//
//  PresentRoutes.swift
//  
//
//  Created by Daniil on 01.06.2023.
//

import UIKit

// MARK: - PresentRoutes

public protocol PresentRoutes: CoreCoordinator {
    var presenting: UIViewController? { get }
}

public extension PresentRoutes {
    func present<Coordinator: CoreCoordinator>(
        coordinator: Coordinator?,
        rootController: Coordinator.Root,
        animated: Bool,
        completion: (() -> Void)? = nil
    ) where Coordinator.Root: UIViewController {
        coordinator?.set(container: rootController)
        coordinator?.start()

        coordinator?.finish = { [weak self] in
            self?.dismiss(animated: $0?.animated ?? true, completion: $0?.completion)
        }

        let presentingController = presenting?.topPresentedController ?? presenting
        presentingController?.present(rootController, animated: animated, completion: completion)
    }

    func dismiss(
        animated: Bool,
        completion: (() -> Void)? = nil
    ) {
        presenting?.dismiss(animated: animated, completion: completion)
    }

    // Нужен present, где в качестве root будет обычный UIViewController
    // Нужен ли?? Мб для всяких alert или snack. А мб у них не будет координатора и не надо выдумывать тогда

    // Все что ниже проверить

    func present<Coordinator: CoreCoordinator>(
        coordinator: Coordinator?,
        rootController: UINavigationController,
        animated: Bool,
        completion: (() -> Void)? = nil
    ) where Coordinator.Root.Module == AnyCoordinator<UINavigationController> {
//        present(coordinator: coordinator?.activate(), rootController: rootController, animated: animated, completion: completion)
    }

    func present(
        viewController: UIViewController,
        animated: Bool,
        completion: (() -> Void)? = nil
    ) where Root.Module == UIViewController {
        let presentingController = presenting?.topPresentedController ?? presenting
        presentingController?.present(viewController, animated: animated, completion: completion)

        activate(container: viewController)
    }
}
