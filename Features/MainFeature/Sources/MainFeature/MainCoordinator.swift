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

final class MainCoordinator: BaseCoordinator<Assembly, BaseCoordinatorContext>, MainCoordinatorProtocol {
    init(
        assembly: Assembly,
        storage: CoordinatorActionHandlerStorageProtocol
    ) {
        super.init(assembly: assembly, context: .init(), storage: storage)
    }

    var output: BaseArch.ActionClosure?

    override func start() {

    }
}
