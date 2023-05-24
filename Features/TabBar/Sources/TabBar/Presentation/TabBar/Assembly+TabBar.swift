//
//  File.swift
//  
//
//  Created by Daniil on 24.05.2023.
//

import DipCore
import UIKit

extension Assembly {
    func registerTabBar() {
        Dependency.register { (navigationController: UINavigationController) in
            TabBarCoordinator(
                navigationController: navigationController,
                assembly: self,
                context: .init(),
                storage: Dependency.resolve()
            )
        }
        .implements(TabBarCoordinatorProtocol.self)
    }
}
