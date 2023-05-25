//
//  MainCoordinator.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import UIKit

//public protocol MainCoordinatorProtocol: CoordinatorProtocol {
//    var output: ActionClosure? { get set }
//}

final class MainCoordinator: NavigationCoordinator<Assembly, BaseCoordinatorContext> {
    init(
        assembly: Assembly,
        storage: CoordinatorActionHandlerStorageProtocol
    ) {
        super.init(assembly: assembly, context: .init(), storage: storage)
    }

    var output: BaseArch.ActionClosure?

    override func make() -> UIViewController? {
        nil
    }
}
