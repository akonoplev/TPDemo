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

final class ProfileCoordinator: NavigationCoordinator<Assembly, BaseCoordinatorContext>, ProfileCoordinatorProtocol {
    override func make() -> UIViewController? {
        nil
    }
}
