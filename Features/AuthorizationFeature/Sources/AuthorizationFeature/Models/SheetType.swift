//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 08.06.2023.
//

import BaseArch

extension SourceSheetType {
    var title: String {
        switch self {
        case .cart:
            return "Авторизуйся или иди нахуй"
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
