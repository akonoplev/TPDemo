//
//  TimeInterval+Time.swift
//  Technopark
//
//  Created by Илья on 01.11.2022.
//

import Foundation

public extension TimeInterval {
    init(minutes: Double) {
        self = minutes * 60
    }

    init(hours: Double) {
        self = hours * 60 * 60
    }

    init(days: Double) {
        self = days * 24 * 60 * 60
    }
}
