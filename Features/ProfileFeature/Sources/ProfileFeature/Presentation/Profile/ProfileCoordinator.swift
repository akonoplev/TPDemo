//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import DipCore
import BaseArch
import SwiftUI

public protocol ProfileCoordinatorProtocol {
    var anyCoordinator: AnyCoordinator<UINavigationController> { get }
}

final class ProfileCoordinator: NavigationCoordinator<Assembly, ProfileCoordinator.Context>, ProfileCoordinatorProtocol {
    struct Context {
        let name: String
    }

    override func start() {
        guard let assembly = assembly else {
            return
        }

        let actionClosure: ActionClosure? = { [weak self] _ in }
        
        let profileVC = assembly.resolver.profileBuilder(name: context.name, actionClosure: actionClosure).build()

        set(viewControllers: [profileVC], animated: false)
    }
}
