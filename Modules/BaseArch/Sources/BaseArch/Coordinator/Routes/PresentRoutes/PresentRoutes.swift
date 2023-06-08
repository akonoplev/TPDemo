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
    /// Простой present контроллера
    func present(
        viewController: UIViewController,
        animated: Bool,
        completion: (() -> Void)? = nil
    ) where Root.Child == UIViewController {
        let presentingController = presenting?.topPresentedController ?? presenting
        presentingController?.present(viewController, animated: animated, completion: completion)

        activate(child: viewController)
    }

    /// Для показа координатора на новом root
    /// Например открытие шторки со своим стеком навигации
    func present<Coordinator: CoreCoordinator>(
        coordinator: Coordinator?,
        rootController: Coordinator.Root,
        animated: Bool,
        completion: (() -> Void)? = nil
    ) where Coordinator.Root: UIViewController {
        coordinator?.navigationType = .modally
        coordinator?.start(on: rootController)

        coordinator?.finish = { [weak self] in
            self?.dismiss(animated: $0?.animated ?? true, completion: $0?.completion)
        }

        let presentingController = presenting?.topPresentedController ?? presenting
        presentingController?.present(rootController, animated: animated, completion: completion)
    }

    /// Для показа одиночного координатора, который сам себе назначает rootController
    func present<Coordinator: CoreCoordinator>(
        coordinator: Coordinator?,
        animated: Bool,
        completion: (() -> Void)? = nil
    ) where Coordinator.Root: UIViewController {
        coordinator?.navigationType = .modally
        coordinator?.start()

        coordinator?.finish = { [weak self] in
            self?.dismiss(animated: $0?.animated ?? true, completion: $0?.completion)
        }

        let presentingController = presenting?.topPresentedController ?? presenting

        if let rootController = coordinator?.root {
            presentingController?.present(rootController, animated: animated, completion: completion)
        }
    }

    /// Простой dismiss
    func dismiss(
        animated: Bool,
        completion: (() -> Void)? = nil
    ) {
        presenting?.dismiss(animated: animated, completion: completion)
    }
}
