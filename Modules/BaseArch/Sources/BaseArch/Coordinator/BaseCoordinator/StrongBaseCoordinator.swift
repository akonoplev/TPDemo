//
//  StrongBaseCoordinator.swift
//  
//
//  Created by Daniil on 08.06.2023.
//

import Foundation

open class StrongBaseCoordinator<Assembly: AnyObject, Context, Root: RootController>: BaseCoordinator<Assembly, Context, Root> {
    private var storedRoot: Root?
    override open var root: Root? {
        get {
            storedRoot
        }
        set {
            storedRoot = newValue
        }
    }
}
