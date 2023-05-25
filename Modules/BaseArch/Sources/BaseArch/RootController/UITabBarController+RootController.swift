//
//  File.swift
//  
//
//  Created by Daniil on 25.05.2023.
//

import UIKit

extension UITabBarController: RootController {
    public typealias Module = BasePresentableCollection<UIViewController>

    public func start(module: Module, animated: Bool) {
        setViewControllers(module.items, animated: animated)
    }

    public func add(module _: BasePresentableCollection<UIViewController>, animated _: Bool) {}
}
