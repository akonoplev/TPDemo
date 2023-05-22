//
//  PhoneNumberFormatter.swift
//  
//
//  Created by Vladislav Bystritskiy on 19.10.2022.
//

import Foundation

public enum PhoneNumberFormatter {
    public struct Format {
        public let mask: String
        public let placeholder: String
        public let maskCharacters: Set<String>

        public init(mask: String) {
            self.mask = mask
            self.placeholder = "_" + mask.replacingOccurrences(of: String(digitMaskCharacter), with: placeholderCharacterString)
            self.maskCharacters = Set<String>(mask.filter { $0 != digitMaskCharacter }.map { String($0) })
        }

        public static let `default` = Format(mask: "X (XXX) XXX-XX-XX")
    }

    public static let validForRequestCharacters = "+0123456789"
    public static let digitMaskCharacter = Character("X")
    public static let placeholderCharacterString = "_"

    public static func formatted(_ number: String?, format: Format = .default) -> String {
        guard var number = number, !number.isEmpty else {
            return ""
        }

        if number.first == "8" {
            number = "+7" + number.dropFirst()
        }

        var cleanPhoneNumber = String(number.unicodeScalars.filter(CharacterSet.decimalDigits.contains))
        var result: String

        if number == "8" || number == "7" {
            result = "+7"
        } else if number.count == 1 && cleanPhoneNumber.count == 1 {
            result = formatted("+7\(cleanPhoneNumber)")
        } else {
            result = "+"
            if cleanPhoneNumber.first != "7" {
                cleanPhoneNumber = "7\(cleanPhoneNumber)"
            }
            var index = cleanPhoneNumber.startIndex
            for maskChar in format.mask {
                if index == cleanPhoneNumber.endIndex {
                    break
                }

                if maskChar == "X" {
                    result.append(cleanPhoneNumber[index])
                    index = cleanPhoneNumber.index(after: index)
                } else {
                    result.append(maskChar)
                }
            }
        }
        return result
    }

    public static func formatInternational(phone: String?) -> String {
        String((phone ?? "").filter(validForRequestCharacters.contains).suffix(10))
    }
}
