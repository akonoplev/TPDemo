//
//  String+Validate.swift
//  
//
//  Created by Vladislav Bystritskiy on 19.10.2022.
//

import Foundation

public extension String {

    var isPhoneValid: Bool {
        let phoneFormat = PhoneNumberFormatter.Format.default

        return self.count == phoneFormat.placeholder.count
            && !self.contains(PhoneNumberFormatter.placeholderCharacterString)
    }

    var isEmailValid: Bool {
        // if email is empty dont need validate
        guard !self.isEmpty else {
            return false
        }

        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }

    var date: Date? {
        guard self.count == 10 else {
            return nil
        }
        return DateFormatter.standart.date(from: self)
    }

    var isNameValid: Bool {
        count > 1 && filterOnlySymbols(from: .decimalDigits).isEmpty && count < 21
    }
}
