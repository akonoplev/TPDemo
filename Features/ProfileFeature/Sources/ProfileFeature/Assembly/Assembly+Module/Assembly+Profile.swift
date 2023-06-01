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
            ProfileCoordinator(assembly: self, context: .init(name: $0), storage: Dependency.resolve())
        }
            .implements(ProfileCoordinatorProtocol.self)

        Dependency.register { [unowned self] (name: String, actionClosure: ActionClosure?) in
            ProfileBuilder(
                context: .init(name: name),
                resolver: self.resolver,
                actionClosure: actionClosure
            )
        }
            .implements(ProfileBuilderProtocol.self)
    }
}
