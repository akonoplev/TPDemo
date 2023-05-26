//
//  MainCoordinator.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import DipCore
import UIKit

public protocol MainPageCoordinatorProtocol: CoordinatorProtocol {

}

final class MainPageCoordinator: BaseCoordinator, MainPageCoordinatorProtocol {

    let output: ActionClosure?
    let navigationController: UINavigationController

    init(
        output: ActionClosure?,
        navigationController: UINavigationController,
        storage: CoordinatorActionHandlerStorageProtocol
    ) {
        self.output = output
        self.navigationController = navigationController
        super.init(storage: storage)
    }

    deinit {
        print("xxxx")
    }

    override func start() {
        let actionClosure: ActionClosure? = { [weak self] action in
            self?.handleModuleAction(action: action) { [weak self] (action: MainPage.Action, _) in
                guard let self = self else {
                    return
                }
                
                switch action {
                case .showAuth:
                    self.output?(MainPageOutputAction.showAuth)
                }
            }
        }

        let vc: MainViewControllerProtocol = Dependency.resolve(arguments: actionClosure)
        navigationController.viewControllers = [vc]
    }
}
