//
//  PropagatingActionHandler.swift
//  
//
//  Created by Андрей Коноплев on 24.05.2023.
//

import Foundation

final class PropagatingActionHandler: ActionHandlerProtocol {
    func handle(action: ActionProtocol, coordinator: CoordinatorProtocol) -> Bool {
        guard let commonAction = action as? CommonAction,
              commonAction.shouldPropagate,
              let actionHandlingCoordinator = coordinator as? ActionHandlingCoordinatorProtocol else {
            return false
        }
        actionHandlingCoordinator.actionClosure?(action)
        return true
    }
}
