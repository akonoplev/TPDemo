//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import DipCore
import UIKit

public enum ProfileAssembly {
    public static func setup() {

        Dependency.register { (output: ActionClosure?, navigationController: UINavigationController) in
            ProfileCoordinator(
                output: output,
                navigationController: navigationController,
                storage: Dependency.resolve()
            )
        }.implements(ProfileCoordinatorProtocol.self)

        Dependency.register { //(actionClosure: ActionClosure?) in
            ProfileViewModel()
        }
        .implements(ProfileViewModelProtocol.self)
    }
}
