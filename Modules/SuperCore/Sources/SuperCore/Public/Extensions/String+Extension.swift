//
//  String+Extension.swift
//  
//
//  Created by Илья on 25.06.2022.
//

import UIKit

public extension String {
    var floatValue: CGFloat? {
        let characterSet = "0123456789.,"
        var stringValue = String(filter(characterSet.contains))
        let numberComponents = stringValue.components(separatedBy: CharacterSet.decimalDigits.inverted)
        if numberComponents.count > 1 {
            stringValue = numberComponents[0] + "." + numberComponents[1]
        }
        if let doubleValue = Double(stringValue) {
            return CGFloat(doubleValue)
        }
        return nil
    }

    var htmlAttributedString: NSAttributedString? {
        let acceptableCharacters = CharacterSet(charactersIn: " <>\"#;").union(.urlPathAllowed)
        let finalString = map { char -> String in
            if acceptableCharacters.contains(char) {
                return String(char)
            } else {
                return char.unicodeScalars.map { "&#\($0.value);" }.joined()
            }
        }.joined()

        if let data = finalString.data(using: .utf8) {
            return try? NSAttributedString(
                data: data,
                options: [.documentType: NSAttributedString.DocumentType.html],
                documentAttributes: nil
            )
        } else {
            return nil
        }
    }

    var decodingUnicodeCharacters: String {
        applyingTransform(.init("Hex-Any"), reverse: false) ?? ""
    }

    var toURL: URL? {
        URL(string: self)
    }

    func addingPercentEncodingForQueryParameter() -> String? {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed)
    }

    var digits: String {
        return filterOnlySymbols(from: CharacterSet.decimalDigits)
    }

    func filterOnlySymbols(from characters: CharacterSet) -> String {
        return filter { characters.contains($0) }
    }
}
