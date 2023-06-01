//
//  WindowRoutes+CoreCoordinator.swift
//  
//
//  Created by Daniil on 01.06.2023.
//

import UIKit

public extension WindowRoutes where Self: CoreCoordinator, Self.Root == UIWindow {
    var window: UIWindow? {
        root
    }
}
