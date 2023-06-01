//
//  PresentRoutes.swift
//  
//
//  Created by Daniil on 01.06.2023.
//

import UIKit

// MARK: - PresentRoutes

public protocol PresentRoutes {
    var presenting: UIViewController? { get }
}

public extension PresentRoutes {
    func present<Coordinator: CoreCoordinator>(
        coordinator: Coordinator?,
        rootController: Coordinator.Root,
        animated: Bool,
        completion: (() -> Void)? = nil
    ) where Coordinator.Root: UIViewController {
        coordinator?.start(on: rootController, animated: false)
        let presentingController = presenting?.topPresentedController ?? presenting
        presentingController?.present(rootController, animated: animated, completion: completion)
    }

    func present<Coordinator: CoreCoordinator>(
        coordinator: Coordinator?,
        rootController: UINavigationController,
        animated: Bool,
        completion: (() -> Void)? = nil
    ) where Coordinator.Root.Module == AnyCoordinator<UINavigationController> {
        present(coordinator: coordinator?.activate(), rootController: rootController, animated: animated, completion: completion)
    }
}
