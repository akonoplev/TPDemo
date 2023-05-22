//
//  CoordinatorActionHandlerStorage.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import Foundation

public protocol CoordinatorActionHandlerStorageProtocol {
    var coordinatorActionHandlers: [ActionHandlerProtocol] { get }
    var moduleActionHandlers: [ActionHandlerProtocol] { get }
}

public class CoordinatorActionHandlerStorage: CoordinatorActionHandlerStorageProtocol {

    public let coordinatorActionHandlers: [ActionHandlerProtocol]
    public let moduleActionHandlers: [ActionHandlerProtocol]

    public init(
        coordinatorActionHandlers: [ActionHandlerProtocol],
        moduleActionHandlers: [ActionHandlerProtocol]
    ) {
        self.coordinatorActionHandlers = coordinatorActionHandlers
        self.moduleActionHandlers = moduleActionHandlers
    }
}
