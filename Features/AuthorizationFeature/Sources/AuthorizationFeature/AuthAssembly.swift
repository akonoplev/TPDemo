//
//  AuthAssembly.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import DipCore

extension Assembly {
    func registerAuth() {
        Dependency.register {
            AuthCoordinator(assembly: self, storage: Dependency.resolve())
        }
            .implements(AuthCoordinatorProtocol.self)
    }
}
