//
//  AppDelegate.swift
//  TPDemo
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import DipCore
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private var assembly: Assembly?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        initialSetup()

        return true
    }
    
    private func initialSetup() {
        let assembly = Assembly()
        self.assembly = assembly

        let appCoordinator = assembly.appCoordinator

        let window = UIWindow()
        self.window = window

        appCoordinator.start(on: window)
    }
}

