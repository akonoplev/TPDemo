//
//  AuthCoordinator.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch

public protocol AuthCoordinatorProtocol: CoordinatorProtocol {
    var output: ActionClosure? { get set }
}

final class AuthCoordinator: BaseCoordinator<Assembly, BaseCoordinatorContext>, AuthCoordinatorProtocol {
    
    var output: ActionClosure?

    override func start() {
        
    }
}
