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
    func authCoordinator(presentType: PresentType) -> AnyCoordinator<UINavigationController>?
    func cardCoordinator() -> AnyCoordinator<UIViewController>?
}
