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
        let tabBarCoordinator: TabBar.TabBarCoordinator = Dependency.resolve()

        start(coordinator: tabBarCoordinator, container: tabBarCoordinator.tabBarController, animated: false)

        return tabBarCoordinator.root
    }


    // Feature1
    // Feature2

    // Feature3 -> output (show Feature 1)
    // func feature1()
}
