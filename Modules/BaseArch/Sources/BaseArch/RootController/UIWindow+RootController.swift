//
//  File.swift
//  
//
//  Created by Daniil on 25.05.2023.
//

import UIKit

extension UIWindow: RootController {
    public typealias Module = UIViewController

    public func start(module: Module, animated _: Bool) {
        rootViewController = module
        makeKeyAndVisible()
    }

    public func add(module _: UIViewController, animated _: Bool) {}
}
