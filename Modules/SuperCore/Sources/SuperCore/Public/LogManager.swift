//
//  LogManager.swift
//  Technopark
//
//  Created by Ivan Arkunov on 15.04.2021.
//  Copyright © 2021 Technopark. All rights reserved.
//

import Foundation

public protocol LogManagerProtocol {
    var log: String { get }
    func verbose(_ message: String)

    func debug(_ message: String)

    func info(_ message: String)

    func warning(_ message: String)

    func error(_ message: String)

    func setEnableLogstashLogging(_ flag: Bool)
    func forceSend()
}

public final class LogManager {
    public var log = ""
    init() {
    }
}

// MARK: - LogManagerProtocol

extension LogManager: LogManagerProtocol {

    public func verbose(_ message: String) {
    }

    public func debug(_ message: String) {
    }

    public func info(_ message: String) {
    }

    public func warning(_ message: String) {
    }

    public func error(_ message: String) {
    }
// swiftlint:enable function_parameter_count

    public func setEnableLogstashLogging(_ flag: Bool) {
    }

    public func forceSend() {
    }
}

// MARK: - Global

// swiftlint:disable:next prefixed_toplevel_constant
public let log = LogManager()
