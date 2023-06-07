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
    func set<Coordinator: CoreCoordinator>(
        modules: [Coordinator],
        animated: Bool
    ) where Coordinator.Root == Self.Root.Child, Coordinator.Root: UIViewController {
        let roots = modules.compactMap { $0.root }
        tabBarController?.setViewControllers(roots, animated: animated)

        activate(childs: roots)

        modules.forEach {
            $0.start()
        }
    }
}
