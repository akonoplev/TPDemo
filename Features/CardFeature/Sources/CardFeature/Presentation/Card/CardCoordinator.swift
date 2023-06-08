//
//  CardCoordinator.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import DipCore
import UIKit

public protocol CardCoordinatorProtocol {
    var anyCoordinator: AnyCoordinator<UIViewController> { get }
}

final class CardCoordinator: ViewControllerCoordinator<Assembly, BaseCoordinatorContext>, CardCoordinatorProtocol {
    override func start() {
        guard let assembly = assembly else {
            return
        }

        let actionClosure: ActionClosure? = { [weak self] action in
            self?.handleModuleAction(action: action) { (action: CardAction, _) in
                switch action {
                case .back:
                    self?.finish?(nil)
                }
            }
        }

        set(controller: assembly.resolver.cardController(actionClosure: actionClosure))
    }
}
