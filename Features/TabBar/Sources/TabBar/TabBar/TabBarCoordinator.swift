//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import DipCore
import ProfileFeature
import MainPage
import UIKit

public protocol TabBarCoordinatorProtocol: CoordinatorProtocol {

}

final class TabBarCoordinator: BaseCoordinator, TabBarCoordinatorProtocol {

    let window: UIWindow
    let output: ActionClosure?
    let tabBarViewController = UITabBarController()

    init(window: UIWindow,
         output: ActionClosure?,
         storage: CoordinatorActionHandlerStorageProtocol) {
        self.window = window
        self.output = output
        super.init(storage: storage)
    }

    override func start() {
        window.rootViewController = tabBarViewController
        tabBarViewController.viewControllers = [makeMainTabViewController(), makeProfileTabModule()]
    }

    private func makeMainTabViewController() -> UIViewController {
        let navController = UINavigationController()
        navController.tabBarItem = UITabBarItem(title: "", image: .add, tag: 0)
        tabBarViewController.viewControllers = [navController]

        let coordinator: MainPageCoordinatorProtocol = Dependency.resolve(
            arguments: output,
            navController
        )
        startCoordinator(coordinator)
        return navController
    }

    private func makeProfileTabModule() -> UIViewController {
        let navController = UINavigationController()
        navController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "heart.fill"), tag: 1)
        tabBarViewController.viewControllers = [navController]

        let coordinator: ProfileCoordinatorProtocol = Dependency.resolve(
            arguments: output,
            navController
        )
        startCoordinator(coordinator)
        return navController
    }
}
