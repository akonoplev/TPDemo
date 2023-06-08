//
//  TabBarRoutes.swift
//  
//
//  Created by Daniil on 06.06.2023.
//

import UIKit

// MARK: - TabBarRoutes

public protocol TabBarRoutes: CoreCoordinator {
    var tabBarController: UITabBarController? { get }
}

public extension TabBarRoutes {
    /// Выставление контроллеров в tabBar
    func set(
        controllers: [UIViewController],
        animated: Bool
    ) where Root.Child == UIViewController {
        tabBarController?.setViewControllers(controllers, animated: animated)

        activate(childs: controllers)
    }

    /// Выставление координаторов в tabBar
    /// В качестве контроллеров берутся root у координаторов
    func set<Coordinator: CoreCoordinator>(
        modules: [Coordinator],
        animated: Bool
    ) where Coordinator.Root: UIViewController {
        let roots = modules.compactMap { $0.root }
        tabBarController?.setViewControllers(roots, animated: animated)

        activate(childs: roots)

        modules.forEach {
            $0.navigationType = .tabBar
            $0.start()
        }
    }
}
