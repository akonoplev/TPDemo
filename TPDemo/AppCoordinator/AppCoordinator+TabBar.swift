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
    func mainCoordinator() -> AnyCoordinator<UINavigationController>? {
        guard let assembly = assembly else {
            return nil
        }

        let mainCoordinator = assembly.mainAssembly.resolver.mainCoordinator()

        mainCoordinator.anyCoordinator.start(on: assembly.resolver.mainNavigationController(), animated: false)

        return mainCoordinator.anyCoordinator
    }

    func profileCoordinator() -> AnyCoordinator<UINavigationController>? {
        guard let assembly = assembly else {
            return nil
        }

        let profileCoordinator = assembly.profileAssembly.resolver.profileCoordinator(name: "Валера").anyCoordinator

        profileCoordinator.anyCoordinator.start(on: assembly.resolver.profileNavigationController(), animated: false)

        return profileCoordinator.anyCoordinator
    }
}
