//
//  TabbarCoordinator.swift
//  
//
//  Created by Daniil on 25.05.2023.
//

import UIKit

public typealias BaseTabBarCoordinator<Assembly: AnyObject, Context> = BaseCoordinator<Assembly, Context, UITabBarController> & TabBarRoutes
