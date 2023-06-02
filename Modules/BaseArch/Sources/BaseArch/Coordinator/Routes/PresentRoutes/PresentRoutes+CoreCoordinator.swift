//
//  PresentRoutes+CoreCoordinator.swift
//  
//
//  Created by Daniil on 01.06.2023.
//

import UIKit

public extension PresentRoutes where Self: CoreCoordinator, Self.Root: UIViewController {
    var presenting: UIViewController? {
        root
    }
}
