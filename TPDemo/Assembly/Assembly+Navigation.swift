//
//  Assembly+Navigation.swift
//  TPDemo
//
//  Created by Daniil on 26.05.2023.
//

import DipCore
import UIKit

enum TabController: String, DependencyTag {
    case root
}

enum Tab: Int, DependencyTag {
    case main
}

extension Assembly {
    func registerNavigation() {
        Dependency.register(tag: TabController.root) {
            UITabBarController()
        }
        .implements(UITabBarController.self)

        Dependency.register(tag: Tab.main) {
            UINavigationController(rootViewController: UIViewController())
        }
        .implements(UINavigationController.self)
    }
}
