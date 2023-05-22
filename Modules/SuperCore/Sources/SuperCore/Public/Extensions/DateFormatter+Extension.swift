//
//  DateFormatter+Extension.swift
//  Technopark
//
//  Created by Денис Демидов on 25.01.2021.
//  Copyright © 2021 Technopark. All rights reserved.
//

import Foundation

public extension DateFormatter {

    static let fullDateTime: DateFormatter = {
        DateFormatter(format: "yyyy-MM-dd'T'HH:mm:ssXXX")
    }()

    static let dotSeparatedDayMonthYear: DateFormatter = {
        DateFormatter(format: "d.MM.yyyy", locale: "ru_RU")
    }()

    static let standart: DateFormatter = {
        DateFormatter(format: "dd.MM.yyyy", locale: "ru_RU")
    }()

    static let dayMonthYear: DateFormatter = {
        DateFormatter(format: "d MMM yyyy", locale: "ru_RU")
    }()

    static let dayShortMonth: DateFormatter = {
        DateFormatter(format: "d MMM", locale: "ru_RU")
    }()

    static let dayFullMonth: DateFormatter = {
        DateFormatter(format: "d MMMM", locale: "ru_RU")
    }()

    static let dayOfWeek: DateFormatter = {
        DateFormatter(format: "E", locale: "ru_RU")
    }()

    static let dayTime: DateFormatter = {
        DateFormatter(format: "HH:mm", locale: "ru_RU")
    }()

    convenience init(format: String, locale: String? = nil) {
        self.init()

        self.dateFormat = format
        if let locale = locale {
            self.locale = Locale(identifier: locale)
        }
    }
}
