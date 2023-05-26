//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import DipCore
import UIKit

public enum TabBarAssembly {
    public static func setup() {
        Dependency.register { (window: UIWindow, output: ActionClosure?) in
            TabBarCoordinator(
                window: window,
                output: output,
                storage: Dependency.resolve()
            )
        }.implements(TabBarCoordinatorProtocol.self)
    }
}
