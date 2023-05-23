//
//  AppCoordinator.swift
//  TPDemo
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import Foundation
import UIKit

final class AppCoordinator {

    private var window: UIWindow?

    func start(on window: UIWindow) {
        self.window = window
        
        let viewController = UIViewController()
        viewController.view.backgroundColor = UIColor.red
        window.rootViewController = viewController
    }


    // Feature1
    // Feature2

    // Feature3 -> output (show Feature 1)
    // func feature1()
}
