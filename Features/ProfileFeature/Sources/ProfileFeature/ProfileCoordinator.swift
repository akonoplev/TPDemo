//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import DipCore
import BaseArch
import SwiftUI

//public protocol MainCoordinatorProtocol: CoordinatorProtocol {
//    var output: ActionClosure? { get set }
//}

final class MainCoordinator: NavigationCoordinator<Assembly, BaseCoordinatorContext> {

    var output: ActionClosure?

    override func make() -> UIViewController? {
        nil
    }
}
