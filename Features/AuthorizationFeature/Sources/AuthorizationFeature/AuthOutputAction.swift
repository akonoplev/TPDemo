//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 24.05.2023.
//

import BaseArch

public enum AuthOutputAction: ActionProtocol {
    case didFinish
    case didAuth
    case showCatalog
}
