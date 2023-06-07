//
//  NavigationRoutes.swift
//  
//
//  Created by Daniil on 01.06.2023.
//

import UIKit

// MARK: - NavigationRoutes

public protocol NavigationRoutes: CoreCoordinator {
    var navigationController: UINavigationController? { get }
}

public extension NavigationRoutes {
    func push(
        viewController: UIViewController,
        animated: Bool
    ) where Root.Module == UIViewController {
        navigationController?.pushViewController(viewController, animated: animated)

        activate(container: viewController)

        finish = { [weak self] in
            self?.pop(animated: $0?.animated ?? true)
        }
    }

    func set(
        viewControllers: [UIViewController],
        animated: Bool
    ) where Root.Module == UIViewController {
        navigationController?.setViewControllers(viewControllers, animated: animated)

        activate(containers: viewControllers)
    }

    func replaceWith(
        viewController: UIViewController,
        direction: WindowTransitionOptions.Direction,
        animated: Bool
    ) {
        let options: WindowTransitionOptions = .init(direction: direction)

        if animated {
            navigationController?.view.window?.layer.add(options.animation, forKey: kCATransition)
            navigationController?.view.window?.makeKeyAndVisible()
        }
        navigationController?.setViewControllers([viewController], animated: false)
    }

    func replaceCurrent(
        viewController: UIViewController,
        animated: Bool
    ) {
        if let navСontroller = navigationController {
            let newStack = navСontroller.viewControllers.dropLast() + [viewController]
            navСontroller.setViewControllers(Array(newStack), animated: animated)
        }
    }

    func pop(
        to viewController: UIViewController,
        animated: Bool
    ) {
        guard let navigationController = navigationController else {
            return
        }

        guard navigationController.viewControllers.last !== viewController else {
            return
        }

        guard navigationController.viewControllers.contains(where: { $0 === viewController }) else {
            return
        }

        navigationController.popToViewController(viewController, animated: animated)
    }

    func pop(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }

    func share(link: URL) {
        let activityVC = UIActivityViewController(
            activityItems: [link],
            applicationActivities: nil
        )
        activityVC.modalPresentationStyle = .formSheet

        navigationController?.present(activityVC, animated: true)
    }

    func clearNavigationStackToRoot() {
        guard
            var viewControllers = navigationController?.viewControllers,
            let root = viewControllers.first,
            let last = viewControllers.last,
            viewControllers.count > 1
        else {
            return
        }

        viewControllers.removeAll()
        viewControllers = [root, last]

        navigationController?.viewControllers = viewControllers
    }
}

public extension NavigationRoutes {
    // Все что ниже проверить
    
//    func push<Coordinator: CoreCoordinator>(
//        coordinator: Coordinator?,
//        animated: Bool
//    ) where Coordinator.Root == UINavigationController {
//        coordinator?.root = navigationController
//
//        if let controller = coordinator?.activate() {
//            navigationController?.pushViewController(controller, animated: animated)
//        }
//    }
//
//    func push<Coordinator: CoreCoordinator>(
//        coordinator: Coordinator?,
//        animated: Bool
//    ) where Coordinator.Root.Module == AnyCoordinator<UINavigationController> {
//        push(coordinator: coordinator?.activate(), animated: animated)
//    }
//
//    func replaceWith<Coordinator: CoreCoordinator>(
//        coordinator: Coordinator?,
//        animated: Bool
//    ) where Coordinator.Root == UINavigationController {
//        coordinator?.root = navigationController
//
//        if let controller = coordinator?.activate() {
//            navigationController?.setViewControllers([controller], animated: animated)
//        }
//    }
//
//    func replaceWith<Coordinator: CoreCoordinator>(
//        coordinator: Coordinator?,
//        direction: WindowTransitionOptions.Direction,
//        animated: Bool
//    ) where Coordinator.Root == UINavigationController {
//        coordinator?.root = navigationController
//        let options: WindowTransitionOptions = .init(direction: direction)
//
//        if let controller = coordinator?.activate() {
//            if animated {
//                navigationController?.view.window?.layer.add(options.animation, forKey: kCATransition)
//                navigationController?.view.window?.makeKeyAndVisible()
//            }
//            navigationController?.setViewControllers([controller], animated: false)
//        }
//    }
//
//    func replaceCurrent<Coordinator: CoreCoordinator>(
//        coordinator: Coordinator?,
//        animated: Bool
//    ) where Coordinator.Root == UINavigationController {
//        coordinator?.root = navigationController
//
//        if let controller = coordinator?.activate(), let navСontroller = navigationController {
//            let newStack = navСontroller.viewControllers.dropLast() + [controller]
//            navigationController?.setViewControllers(Array(newStack), animated: animated)
//        }
//    }
//
//    func pop<Coordinator: CoreCoordinator>(
//        to coordinator: Coordinator?,
//        animated: Bool
//    ) where Coordinator.Root == UINavigationController {
//        guard let coordinator = coordinator, let navigationController = navigationController else {
//            return
//        }
//
//        guard let module = CoordinatorsStorage.shared.modules(for: coordinator).last as? UIViewController else {
//            return
//        }
//
//        guard navigationController.viewControllers.last !== module else {
//            return
//        }
//
//        guard navigationController.viewControllers.contains(where: { $0 === module }) else {
//            return
//        }
//
//        navigationController.popToViewController(module, animated: animated)
//    }
}
