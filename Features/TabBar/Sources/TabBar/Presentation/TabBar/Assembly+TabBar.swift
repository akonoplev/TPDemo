//
//  File.swift
//  
//
//  Created by Daniil on 24.05.2023.
//

import BaseArch
import DipCore
import UIKit

extension Assembly {
    func registerTabBar() {
        Dependency.register {
            TabBarCoordinator(
                assembly: self,
                context: .init(),
                storage: Dependency.resolve()
            )
        }
        .implements(TabBarCoordinatorProtocol.self)
    }
}
