//
//  OutputRoutes.swift
//  
//
//  Created by Daniil on 24.05.2023.
//

import BaseArch
import UIKit

public protocol OutputRoutes {
    func mainCoordinator() -> AnyCoordinator<UINavigationController>?
    func profileCoordinator() -> AnyCoordinator<UINavigationController>?
}
