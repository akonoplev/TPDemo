//
//  Date+Extension.swift
//  
//
//  Created by Илья on 17.05.2023.
//

import Foundation

public extension Date {

    var year: Int? {
        let components = Calendar.current.dateComponents([.year], from: self)
        return components.year
    }

    var ageFromBirthDate: Int? {
        guard let currentYear = Date().year, let birthYear = self.year else {
            return nil
        }
        return currentYear - birthYear
    }
}
