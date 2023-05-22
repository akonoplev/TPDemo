//
//  Date+Formatter.swift
//  
//
//  Created by Андрей Коноплев on 05.09.2022.
//

import Foundation

public extension Date {
    var standardStringFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: self)
    }
}
