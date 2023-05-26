//
//  AppDelegate.swift
//  TPDemo
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        AppAssebly.setup()
        
        let window = UIWindow()
        self.window = window
        appCoordinator = AppCoordinator(window: window)
        appCoordinator.start()

        return true
    }
}

