//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 06.06.2023.
//

import SuperCore
import BaseArch

public struct AuthContext {
    public let phone: String
    public let presentType: PresentType

    public init(
        phone: String,
        presentType: PresentType
    ) {
        self.phone = phone
        self.presentType = presentType
    }
}
