//
//  ViewControllerCoordinator.swift
//  
//
//  Created by Daniil on 08.06.2023.
//

import UIKit

public typealias ViewControllerCoordinator<Assembly: AnyObject, Context> = StrongBaseCoordinator<Assembly, Context, UIViewController> & SingleRoutes
