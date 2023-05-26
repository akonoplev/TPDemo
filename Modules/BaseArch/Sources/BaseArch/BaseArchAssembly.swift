//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 24.05.2023.
//

import DipCore
import Foundation

public enum BaseArchAssembly {
    public static func setup() {
        Dependency.register {
            CoordinatorActionHandlerStorage(
                coordinatorActionHandlers: [PropagatingActionHandler()],
                moduleActionHandlers: [
                    PropagatingActionHandler()
                ]
            )
        }
            .implements(CoordinatorActionHandlerStorageProtocol.self)
    }
}
