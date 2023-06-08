//
//  File.swift
//  
//
//  Created by Daniil on 31.05.2023.
//

import BaseArch

extension Auth.Code {
    enum Action: ActionProtocol {
        case didAuth
        case changePhone
    }
}
