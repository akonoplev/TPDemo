//
//  RootController.swift
//  
//
//  Created by Daniil on 24.05.2023.
//

import Foundation

public protocol RootController: AnyObject {
    associatedtype Module: CorePresentable
}
