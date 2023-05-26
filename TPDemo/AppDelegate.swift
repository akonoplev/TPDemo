//
//  AppDelegate.swift
//  TPDemo
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import UIKit
import DipCore
import MainFeature

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

//    private lazy var appCoordinator: any Coordinator<UIWindow, Void> = {
//        return AppCoordinator { rootVC in
//            let mainCoordinator: MainFeature.MainCoordinatorProtocol = Dependency.resolve(arguments: rootVC)
//            return CoordinatorAdapter(base: mainCoordinator)
//        } authCoordinatorAssembly: <#(UIViewController) -> Coordinator<Void, Action>#>
//    }()

    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let rootController = UIViewController()
        AppAssebly.setup(rootController: rootController)

        window = UIWindow(frame: UIScreen.main.bounds)

        if let currentWindow = window {
            currentWindow.rootViewController = rootController
            currentWindow.makeKeyAndVisible()
        }

        let appComposer = AppComposition()
        let coordinator = appComposer.composeCoordinator()
        self.appCoordinator = coordinator
        coordinator.start(input: nil, onComplete: nil)

        return true
    }
}
