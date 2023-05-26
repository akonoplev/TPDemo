//
//  AppCoordinator+TabBar.swift
//  TPDemo
//
//  Created by Daniil on 24.05.2023.
//

import BaseArch
import DipCore
import MainFeature
import ProfileFeature
import UIKit
import TabBar

extension AppCoordinator: TabBar.OutputRoutes {
    func mainCoordinator() -> AnyCoordinator<UINavigationController> {
        let mainCoordinator: MainFeature.MainCoordinatorProtocol = Dependency.resolve()
        let navigationController: UINavigationController = Dependency.resolve(tag: Tab.main)

        mainCoordinator.anyCoordinator.start(on: navigationController, animated: false)

        return mainCoordinator.anyCoordinator
    }

    func profileCoordinator() -> AnyCoordinator<UINavigationController> {
        let profileCoordinator: ProfileFeature.ProfileCoordinatorProtocol = Dependency.resolve()

        return profileCoordinator.anyCoordinator
    }
}
