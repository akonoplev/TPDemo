//
//  SheetType.swift
//  
//
//  Created by Daniil on 08.06.2023.
//

import Foundation

public enum SheetType {
    case cart
    case subscribeToProduct
}

extension SheetType {
    var title: String {
        switch self {
        case .cart:
            return "Корзина"
        case .subscribeToProduct:
            return "Подписаться на продукт"
        }
    }

    var description: String {
        switch self {
        case .cart:
            return "Корзина"
        case .subscribeToProduct:
            return "Подписаться на продукт"
        }
    }
}
