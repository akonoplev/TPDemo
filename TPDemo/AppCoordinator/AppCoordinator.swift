//
//  AppCoordinator.swift
//  TPDemo
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import DipCore
import Foundation
import TabBar
import UIKit

final class AppCoordinator: WindowCoordinator<Assembly, BaseCoordinatorContext> {
    override func make() -> UIViewController? {
        startTabBar()
    }

    private func startTabBar() -> UIViewController? {
        guard let assembly = assembly else {
            return nil
        }

        let tabBarCoordinator = assembly.tabBarAssembly.resolver.tabBarCoordinator()
        let tabBarController: UITabBarController = assembly.resolver.rootTabBarController()

        start(coordinator: tabBarCoordinator.anyCoordinator, container: tabBarController, animated: false)

        return tabBarCoordinator.anyCoordinator.root
    }
}
