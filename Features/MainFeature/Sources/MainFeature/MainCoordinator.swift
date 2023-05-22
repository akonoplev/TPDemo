//
//  MainCoordinator.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch

public protocol MainCoordinatorProtocol: CoordinatorProtocol {
    var output: ActionClosure? { get set }
}

final class MainCoordinator: BaseCoordinator, MainCoordinatorProtocol {
    var output: BaseArch.ActionClosure?

    override func start() {

    }
}
