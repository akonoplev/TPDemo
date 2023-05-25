//
//  AuthCoordinator.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import UIKit

//public protocol AuthCoordinatorProtocol: CoordinatorProtocol {
//    var output: ActionClosure? { get set }
//}

final class AuthCoordinator: NavigationCoordinator<Assembly, BaseCoordinatorContext> {
    
    var output: ActionClosure?

    override func make() -> UIViewController? {
        nil
    }
}
