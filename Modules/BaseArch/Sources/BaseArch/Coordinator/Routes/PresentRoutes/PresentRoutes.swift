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
    func present(
        viewController: UIViewController,
        animated: Bool,
        completion: (() -> Void)? = nil
    ) where Root.Child == UIViewController {
        let presentingController = presenting?.topPresentedController ?? presenting
        presentingController?.present(viewController, animated: animated, completion: completion)

        activate(child: viewController)
    }

    func present<Coordinator: CoreCoordinator>(
        coordinator: Coordinator?,
        rootController: Coordinator.Root,
        animated: Bool,
        completion: (() -> Void)? = nil
    ) where Coordinator.Root: UIViewController {
        coordinator?.start(on: rootController)

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
}
