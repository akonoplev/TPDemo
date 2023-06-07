//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 07.06.2023.
//

import BaseArch

extension SheetType {

    var title: String {
        switch self {
        case .cart:
            return "Корзина"
        case .subscribeToProduct:
            return "Подписаться на продутк"
        }
    }

    var description: String {
        switch self {
        case .cart:
            return "Корзина"
        case .subscribeToProduct:
            return "Подписаться на продутк"
        }
    }

}
