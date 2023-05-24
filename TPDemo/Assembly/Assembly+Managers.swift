//
//  Assembly+Managers.swift
//  TPDemo
//
//  Created by Daniil on 24.05.2023.
//

import BaseArch
import DipCore
import Foundation

extension Assembly {
    func registerManagers() {
        Dependency.register {
            CoordinatorActionHandlerStorage(
                coordinatorActionHandlers: [],
                moduleActionHandlers: []
            )
        }
        .implements(CoordinatorActionHandlerStorageProtocol.self)
    }
}
