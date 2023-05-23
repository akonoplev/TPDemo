//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import DipCore

public enum ProfileAssembly {
    public static func setup() {
        Dependency.register { (actionClosure: ActionClosure?) in
            ProfileViewModel(actionClosure: actionClosure)
        }
        .implements(ProfileViewModelProtocol.self)
    }
}
