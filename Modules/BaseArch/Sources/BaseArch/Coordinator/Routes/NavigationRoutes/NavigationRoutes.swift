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
    /// Простой push контроллера в стек навигации
    func push(
        viewController: UIViewController,
        animated: Bool
    ) where Root.Child == UIViewController {
        navigationController?.pushViewController(viewController, animated: animated)

        activate(child: viewController)
    }

    /// Выставление готового навигационного стека
    func set(
        viewControllers: [UIViewController],
        animated: Bool
    ) where Root.Child == UIViewController {
        navigationController?.setViewControllers(viewControllers, animated: animated)

        activate(childs: viewControllers)
    }

    /// Выставление готового навигационного стека с возможностью анимации
    func replaceWith(
        viewControllers: [UIViewController],
        direction: WindowTransitionOptions.Direction,
        animated: Bool
    ) where Root.Child == UIViewController {
        let options: WindowTransitionOptions = .init(direction: direction)

        if animated {
            navigationController?.view.window?.layer.add(options.animation, forKey: kCATransition)
            navigationController?.view.window?.makeKeyAndVisible()
        }
        navigationController?.setViewControllers(viewControllers, animated: false)

        activate(childs: viewControllers)
    }

    /// Подмена последнего контроллера в стеке навигации на передаваемый
    func replaceCurrent(
        viewController: UIViewController,
        animated: Bool
    ) where Root.Child == UIViewController {
        if let navСontroller = navigationController {
            let newStack = navСontroller.viewControllers.dropLast() + [viewController]
            navСontroller.setViewControllers(Array(newStack), animated: animated)

            activate(child: viewController)
        }
    }

    /// Простой pop из стека навигации
    func pop(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }

    /// Pop до определенного контроллера в стеке навигации
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

    /// Открыть activity экран для шаринга ссылки
    func share(link: URL) {
        let activityVC = UIActivityViewController(
            activityItems: [link],
            applicationActivities: nil
        )
        activityVC.modalPresentationStyle = .formSheet

        navigationController?.present(activityVC, animated: true)
    }

    /// Очистка промежуточного стека навигации. Остается только первый и последний контроллеры в стеке
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
    /// Для старта координатора из текущего NavigationController
    /// Root текущего координатора передастся в открываемый
    func startOnCurrentRoot<Coordinator: CoreCoordinator>(
        coordinator: Coordinator?,
        animated: Bool
    ) where Coordinator.Root == Root {
        guard let root = root else {
            return
        }

        coordinator?.finish = { [weak self, weak topViewController = navigationController?.topViewController] in
            guard let topViewController = topViewController else {
                return
            }
            self?.pop(to: topViewController, animated: $0?.animated ?? true)
        }

        coordinator?.navigationType = .navigationStack

        coordinator?.start(on: root)
    }

    /// Для старта координатора со своим rootController
    /// Например для открытия TabBarCoordinator внутри Navigation стека
    func push<Coordinator: CoreCoordinator>(
        coordinator: Coordinator?,
        rootController: Coordinator.Root,
        animated: Bool
    ) where Coordinator.Root: UIViewController {
        finish = { [weak self] in
            self?.pop(animated: $0?.animated ?? true)
        }

        navigationController?.pushViewController(rootController, animated: animated)

        coordinator?.navigationType = .navigationStack

        coordinator?.start(on: rootController)
    }
}
