//
//  AppCoordinator.swift
//  TPDemo
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import Foundation
import UIKit
import MainFeature
import TabBar
import ProfileFeature
import AuthorizationFeature

final class AppCoordinator: Coordinator {

    typealias Output = Void
    typealias Input = Void?

    private let mainCoordinatorAssembly: any Coordinator<Void, MainFeature.Action>
    private let authCoordinatorAssembly: any Coordinator<Void, AuthorizationFeature.Action>

    
    private var mainCoordinator: (any Coordinator<Void, MainFeature.Action>)?
    private var tabBarCoordinator: (any Coordinator<Void, Void>)?
    private var authCoordinator: (any Coordinator<Void, AuthorizationFeature.Action>)?

    init(mainCoordinatorAssembly: any Coordinator<Void, MainFeature.Action>,
         authCoordinatorAssembly: any Coordinator<Void, AuthorizationFeature.Action>
    ) {
        self.mainCoordinatorAssembly = mainCoordinatorAssembly
        self.authCoordinatorAssembly = authCoordinatorAssembly
    }

    func start(input: Input, onComplete: ((Output) -> Void)?) {
        let mainCoordinator = mainCoordinatorAssembly
        self.mainCoordinator = mainCoordinator
        mainCoordinator.start(input: (), onComplete: { [weak self] action in
            switch action {
            case .showAuth:
                self?.auth()
            case .tabBar:
                break
            }
//            self?.mainCoordinator = nil
        })
    }

    func auth() {
        let coordinator = authCoordinatorAssembly
        self.authCoordinator = coordinator

        coordinator.start(input: ()) { [weak self]  action in
            switch action {
            case .showPhone:
                break
            }
        }
    }


    // Feature1
    // Feature2

    // Feature3 -> output (show Feature 1)
    // func feature1()
}
