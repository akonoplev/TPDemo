//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import Foundation

public protocol CoordinatorProtocol: AnyObject {
    var output: ActionClosure? { get set }
    func start()
}
