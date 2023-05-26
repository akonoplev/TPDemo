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
        let tabBarCoordinator: TabBar.TabBarCoordinatorProtocol = Dependency.resolve()
        let tabBarController: UITabBarController = Dependency.resolve(tag: TabController.root)

        start(coordinator: tabBarCoordinator.anyCoordinator, container: tabBarController, animated: false)

        return tabBarCoordinator.anyCoordinator.root
    }
}
