//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import Foundation

public protocol ActionHandlerProtocol {
    func handle(action: ActionProtocol, coordinator: Coordinator) -> Bool
}
