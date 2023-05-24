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

final class AppCoordinator: BaseCoordinator<Assembly, BaseCoordinatorContext> {

    private var window: UIWindow?
    private var mainNavigationController = UINavigationController(rootViewController: UIViewController())

    func start(on window: UIWindow) {
        self.window = window

        window.rootViewController = mainNavigationController
        window.makeKeyAndVisible()

        startTabBar()
    }

    private func startTabBar() {
        let tabBarCoordinator: TabBarCoordinatorProtocol = Dependency.resolve(arguments: mainNavigationController)
        startCoordinator(tabBarCoordinator)
    }


    // Feature1
    // Feature2

    // Feature3 -> output (show Feature 1)
    // func feature1()
}
