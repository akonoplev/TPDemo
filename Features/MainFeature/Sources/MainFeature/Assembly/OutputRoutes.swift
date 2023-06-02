//
//  OutputRoutes.swift
//  
//
//  Created by Daniil on 24.05.2023.
//

import BaseArch
import SuperCore
import UIKit

public protocol OutputRoutes {
    func authCoordinator(finish: @escaping VoidClosure) -> AnyCoordinator<UINavigationController>?
}
