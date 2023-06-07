//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 06.06.2023.
//

import SuperCore
import Foundation


public struct AuthContext {
    public let phone: String
    public let finish: VoidClosure

    public init(phone: String, finish: @escaping VoidClosure) {
        self.phone = phone
        self.finish = finish
    }
}
