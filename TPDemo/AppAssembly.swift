//
//  AppAssembly.swift
//  TPDemo
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import AuthorizationFeature
import MainFeature
import ProfileFeature
import UIKit
import TabBar
import DipCore
import BaseArch

enum AppAssebly {
    static func setup(rootController: UIViewController) {
        Dependency.register {
                    CoordinatorActionHandlerStorage(
                        coordinatorActionHandlers: [],
                        moduleActionHandlers: [
                        ]
                    )
                }
                    .implements(CoordinatorActionHandlerStorageProtocol.self)
        MainAssemly.setup(rootController: rootController)
        AuthAssembly.setup(rootController: rootController)
        ProfileAssembly.setup()
        TabBarAssembly.setup()
    }
}
