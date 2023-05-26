//
//  AuthCoordinator.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import Combine
import DipCore
import UIKit

public protocol AuthCoordinatorProtocol: CoordinatorProtocol {
    var output: AnyPublisher<AuthOutputAction, Never> { get }
}

final class AuthCoordinator: BaseCoordinator, AuthCoordinatorProtocol {
    
    var output: AnyPublisher<AuthOutputAction, Never> {
        outputSubject.eraseToAnyPublisher()
    }
    private let outputSubject = PassthroughSubject<AuthOutputAction, Never>()

    let navigationController = UINavigationController()
    let presentViewController: UIViewController

    init(
        presentViewController: UIViewController,
        storage: CoordinatorActionHandlerStorageProtocol
    ) {
        self.presentViewController = presentViewController
        super.init(storage: storage)
    }

    deinit {
        print("deinit")
    }

    override func start() {
        showPhoneVC()
    }

    func showPhoneVC() {
        let actionClosure: ActionClosure? = { [weak self] action in
            self?.handleModuleAction(action: action) { [weak self] (action: Auth.Phone.Action, _) in
                guard let self = self else {
                    return
                }

                switch action {
                case let .showCode(phone):
                    self.showCode(context: .init(phone: phone))
                    //outputSubject.send(.showCatalogFlow)
                case .didFinish:
                    self.outputSubject.send(.didFinish)
                case .showCatalogFlow:
                    self.outputSubject.send(.showCatalog)
                }
            }
        }
        let viewController: AuthViewControllerProtocol = Dependency.resolve(arguments: actionClosure)
        navigationController.viewControllers = [viewController]
        presentViewController.present(navigationController, animated: true)
    }

    func showCode(context: Auth.Code.Context) {
        let actionClosure: ActionClosure? = { [weak self] action in
            self?.handleModuleAction(action: action) { [weak self] (action: Auth.Code.Action, _) in
                guard let self = self else {
                    return
                }

                switch action {
                case .didAuth:
                    self.navigationController.dismiss(animated: true) {
                        self.outputSubject.send(.didAuth)
                    }
                case .close:
                    self.outputSubject.send(.didFinish)
                }
            }
        }

        let builder: AuthCodeBuilderProtocol = Dependency.resolve(arguments: context, actionClosure)
        self.navigationController.pushViewController(builder.build(), animated: true)
    }
}
