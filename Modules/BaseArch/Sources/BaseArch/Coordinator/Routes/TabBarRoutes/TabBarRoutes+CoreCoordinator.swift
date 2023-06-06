//
//  TabBarRoutes+CoreCoordinator.swift
//  
//
//  Created by Daniil on 06.06.2023.
//

import UIKit

public extension TabBarRoutes where Self: CoreCoordinator, Self.Root == UITabBarController {
    var tabBarController: UITabBarController? {
        root
    }
}
