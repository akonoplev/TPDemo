//
//  AppCoordinator+Main.swift
//  TPDemo
//
//  Created by Daniil on 24.05.2023.
//

import AuthorizationFeature
import BaseArch
import DipCore
import MainFeature
import UIKit

extension AppCoordinator: MainFeature.OutputRoutes {
    func authCoordinator() -> BaseArch.AnyCoordinator<UINavigationController> {
        let authCoordinator: AuthorizationFeature.AuthCoordinatorProtocol = Dependency.resolve()

        return authCoordinator.anyCoordinator
    }
}
