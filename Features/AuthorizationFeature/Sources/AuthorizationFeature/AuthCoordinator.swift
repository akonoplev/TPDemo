//
//  AuthCoordinator.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import DipCore
import UIKit

public protocol AuthCoordinatorProtocol: CoordinatorProtocol {
    var output: ActionClosure? { get set }
}

final class AuthCoordinator: BaseCoordinator, AuthCoordinatorProtocol {
    
    var output: ActionClosure?
    weak var rootViewController: UIViewController?

    init(storage: CoordinatorActionHandlerStorageProtocol,
         rootViewController: UIViewController) {
        self.rootViewController = rootViewController
        super.init(storage: storage)
    }


    override func start() {
        let vc: AuthViewControllerProtocol = Dependency.resolve(arguments: actionClosure)
        vc.modalPresentationStyle = .fullScreen
        rootViewController?.present(vc, animated: false)
    }
}
