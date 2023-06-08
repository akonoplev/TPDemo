//
//  SingleRoutes+CoreCoordinator.swift
//  
//
//  Created by Daniil on 08.06.2023.
//

import UIKit

public extension SingleRoutes where Self: CoreCoordinator, Self.Root: UIViewController {
    var controller: UIViewController? {
        root
    }
}
