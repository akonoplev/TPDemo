//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import DipCore
import BaseArch
import SwiftUI

public protocol ProfileCoordinatorProtocol: CoordinatorProtocol {

}



final class ProfileCoordinator: BaseCoordinator, ProfileCoordinatorProtocol {

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

    override func start() {

        let view = ProfileView(viewModel: ProfileViewModel())
        let vc = UIHostingController(rootView: view)

        self.navigationController.viewControllers = [vc]

    }
}
