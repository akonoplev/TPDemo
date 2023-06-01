//
//  NavigationRoutes+CoreCoordinator.swift
//  
//
//  Created by Daniil on 01.06.2023.
//

import UIKit

public extension NavigationRoutes where Self: CoreCoordinator, Self.Root == UINavigationController {
    var navigationController: UINavigationController? {
        root
    }
}
