//
//  File.swift
//  
//
//  Created by Daniil on 25.05.2023.
//

import UIKit

extension UINavigationController: RootController {
    public typealias Module = UIViewController

    public func start(module: Module, animated: Bool) {
        setViewControllers([module], animated: animated)
    }

    public func add(module: UIViewController, animated: Bool) {
        pushViewController(module, animated: animated)
    }
}
