//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 01.07.2022.
//

import UIKit

extension NumberFormatter {
    static let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0
        formatter.groupingSize = 3
        formatter.locale = Locale(identifier: "ru_RU")

        return formatter
    }()

    static let groupFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSize = 3
        formatter.groupingSeparator = " "
        formatter.locale = Locale(identifier: "ru_RU")

        return formatter
    }()
}

public protocol FormatableNumeric {
    init?(price: String)
}

extension String {
    var priceFormatterValue: String {
        return replacingOccurrences(of: ".", with: ",") // в русской локали NumberFormatter не проглатывает точку
            .components(separatedBy: CharacterSet(charactersIn: "0123456789.,").inverted)
            .joined()
    }
}

extension CGFloat: FormatableNumeric {
    public init?(price: String) {
        guard let numberValue = NumberFormatter.groupFormatter.number(from: price.priceFormatterValue) else {
            return nil
        }
        self = CGFloat(truncating: numberValue)
    }
}

extension Float: FormatableNumeric {
    public init?(price: String) {
        guard let floatValue = NumberFormatter.groupFormatter.number(from: price.priceFormatterValue)?.floatValue else {
            return nil
        }
        self = floatValue
    }
}

extension Double: FormatableNumeric {
    public init?(price: String) {
        guard let doubleValue = NumberFormatter.groupFormatter.number(from: price.priceFormatterValue)?.doubleValue else {
            return nil
        }
        self = doubleValue
    }
}

extension Int: FormatableNumeric {
    public init?(price: String) {
        guard let intValue = NumberFormatter.groupFormatter.number(from: price.priceFormatterValue)?.intValue else {
            return nil
        }
        self = intValue
    }
}

extension NSNumber {
    convenience init?(price: String) {
        guard let value = NumberFormatter.groupFormatter.number(from: price.priceFormatterValue)?.doubleValue else {
            return nil
        }
        self.init(value: value)
    }
}

public protocol NumberFormatable {
    func priceFormatted(currencySymbol: String, digits: Int) -> String
    func groupFormatted(groupingSize: Int) -> String
    func quantityFormatted() -> String
    func formatted(with formatter: NumberFormatter) -> String
}

extension CGFloat: NumberFormatable {}
extension Float: NumberFormatable {}
extension Double: NumberFormatable {}
extension Int: NumberFormatable {}
extension String: NumberFormatable {}

public extension NumberFormatable where Self: FormatableNumeric {
    func priceFormatted(currencySymbol: String = "₽", digits: Int = 0) -> String {
        let formatter = NumberFormatter.priceFormatter
        formatter.currencySymbol = currencySymbol
        formatter.maximumFractionDigits = digits

        return formatted(with: formatter).trimmingCharacters(in: CharacterSet(charactersIn: " "))
    }

    func groupFormatted(groupingSize: Int = 3) -> String {
        let formatter = NumberFormatter.groupFormatter
        formatter.groupingSize = groupingSize

        return formatted(with: formatter)
    }

    func quantityFormatted() -> String {
        return "\(self) шт."
    }

    func formatted(with formatter: NumberFormatter) -> String {
        guard let number = self as? NSNumber else {
            return ""
        }

        return formatter.string(from: number) ?? ""
    }
}

public extension NumberFormatable where Self == String {
    func priceFormatted(currencySymbol: String = "₽", digits: Int = 0) -> String {
        let formatter = NumberFormatter.priceFormatter
        formatter.currencySymbol = currencySymbol
        formatter.maximumFractionDigits = digits

        return formatted(with: formatter)
    }

    func groupFormatted(groupingSize: Int = 3) -> String {
        let formatter = NumberFormatter.priceFormatter
        formatter.groupingSize = groupingSize

        return formatted(with: formatter)
    }

    func quantityFormatted() -> String {
        return "\(self) шт."
    }

    func formatted(with formatter: NumberFormatter) -> String {
        guard let number = Double(self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) else {
            return ""
        }

        return formatter.string(from: number as NSNumber) ?? ""
    }
}
