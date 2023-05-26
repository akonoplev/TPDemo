//
//  AppComposition.swift
//  TPDemo
//
//  Created by Александр Чернов on 24.05.2023.
//

import AuthorizationFeature
import MainFeature
import ProfileFeature
import TabBar
import DipCore
import BaseArch
import UIKit

final class AppComposition {

    func composeCoordinator() -> AppCoordinator {
        return AppCoordinator(mainCoordinatorAssembly: composeMainCoordinator(),
                              authCoordinatorAssembly: composeAuthCoordinator()
        )
    }

    func composeAuthCoordinator() -> any Coordinator<Void, AuthorizationFeature.Action> {
        let authCoordinator: AuthorizationFeature.AuthCoordinatorProtocol = Dependency.resolve()
        return CoordinatorAdapter(base: authCoordinator)
    }

    func composeMainCoordinator() -> any Coordinator<Void, MainFeature.Action> {
        let mainCoordinator: MainFeature.MainCoordinatorProtocol = Dependency.resolve()
        return CoordinatorAdapter(base: mainCoordinator)
    }
}
