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
//    public let authType: AuthType

    public init(
        phone: String
//        authType: AuthType
    ) {
        self.phone = phone
//        self.authType = authType
    }
}
