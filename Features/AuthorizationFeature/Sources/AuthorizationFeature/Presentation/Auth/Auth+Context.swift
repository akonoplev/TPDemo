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
    public let presentType: PresentType<SheetType>

    public init(
        phone: String,
        presentType: PresentType<SheetType>
    ) {
        self.phone = phone
        self.presentType = presentType
    }
}
