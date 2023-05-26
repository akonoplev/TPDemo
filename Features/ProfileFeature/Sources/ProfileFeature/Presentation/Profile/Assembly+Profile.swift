//
//  Assembly+Profile.swift
//  
//
//  Created by Daniil on 26.05.2023.
//

import BaseArch
import DipCore

extension Assembly {
    func registerProfile() {
        Dependency.register {
            ProfileCoordinator(assembly: self, storage: Dependency.resolve())
        }
            .implements(ProfileCoordinatorProtocol.self)

        Dependency.register { (actionClosure: ActionClosure?) in
            ProfileViewModel(actionClosure: actionClosure)
        }
        .implements(ProfileViewModelProtocol.self)
    }
}
