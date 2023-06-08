//
//  File.swift
//  
//
//  Created by Daniil on 08.06.2023.
//

import UIKit

// MARK: - SingleRoutes

public protocol SingleRoutes: CoreCoordinator {
    var controller: UIViewController? { get }
}

public extension SingleRoutes {
    func set(controller: UIViewController) where Root == UIViewController {
        set(container: controller)

        activate(child: controller)
    }
}
