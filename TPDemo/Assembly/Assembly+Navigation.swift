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
    case profile
}

extension Assembly {
    func registerNavigation() {
        Dependency.register(tag: TabController.root) {
            UITabBarController()
        }
        .implements(UITabBarController.self)

        Dependency.register(.singleton, tag: Tab.main) {
            UINavigationController(rootViewController: UIViewController())
        }
        .implements(UINavigationController.self)

        Dependency.register(.singleton, tag: Tab.profile) {
            UINavigationController(rootViewController: UIViewController())
        }
        .implements(UINavigationController.self)
    }
}
