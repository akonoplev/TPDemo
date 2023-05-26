//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 26.05.2023.
//

import BaseArch

extension Auth.Code {
    enum Action: ActionProtocol {
        case didAuth
        case close
    }
}
