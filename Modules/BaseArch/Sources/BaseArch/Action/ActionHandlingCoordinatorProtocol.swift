//
//  ActionHandlingCoordinatorProtocol.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import Foundation

public protocol ActionHandlingCoordinatorProtocol {
    var actionClosure: ActionClosure? { get set }
}
