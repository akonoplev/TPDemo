//
//  AppCoordinator.swift
//  TPDemo
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import DipCore
import Combine
import Foundation
import MainPage
import ProfileFeature
import TabBar
import UIKit

final class AppCoordinator: BaseCoordinator {

    private var window: UIWindow
    var subscriptions = Set<AnyCancellable>()

    init(window: UIWindow) {
        self.window = window
        super.init(storage: Dependency.resolve())
    }

    override func start() {
        startTabBar()
    }

    func startTabBar() {
        let actionClosure: ActionClosure? = { [weak self] action in
            self?.handleModuleAction(action: action) { [weak self] (action: MainPageOutputAction, _) in
                guard let self = self else {
                    return
                }

                switch action {
                case .showAuth:
                    self.showAuth(onViewController: self.window.rootViewController!, didAuth: nil)
                }
            }
        }
        let tabBarCoordinator: TabBarCoordinatorProtocol = Dependency.resolve(
            arguments: window,
            actionClosure
        )
        startCoordinator(tabBarCoordinator)
    }
}
