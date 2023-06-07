//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 07.06.2023.
//

import Foundation

public enum SheetType {
    case cart
    case subscribeToProduct
}

public enum PresentType {
    case fullScreen
    case bottomSheet(sheetType: SheetType)
}
