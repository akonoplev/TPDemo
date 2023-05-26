//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 24.05.2023.
//

import BaseArch

extension Auth.Phone {
    enum Action: ActionProtocol {
        case showCode(phone: String)
        case didFinish
        case showCatalogFlow
    }
}
