//
//  Dependency+Register.swift
//  
//
//  Created by Илья on 26.04.2023.
//

import Dip

// swiftlint:disable large_tuple
public extension Dependency {
    static func register<T, U>(_ definition: Definition<T, U>, tag: DependencyTag? = nil) {
        DipCore.container.register(definition, tag: tag)
    }

    @discardableResult
    static func register<T>(
        _ scope: ComponentScope = .shared,
        type: T.Type = T.self,
        tag: DependencyTag? = nil,
        factory: @escaping (()) throws -> T
    ) -> Definition<T, ()> {
        return DipCore.container.register(scope, type: type, tag: tag, factory: factory)
    }

    @discardableResult
    static func register<T, A>(
        _ scope: ComponentScope = .shared,
        type: T.Type = T.self,
        tag: DependencyTag? = nil,
        factory: @escaping (A) throws -> T
    ) -> Definition<T, A> {
        return DipCore.container.register(
            scope,
            type: type,
            tag: tag,
            factory: factory)
    }

    @discardableResult
    static func register<T, A, B>(
        _ scope: ComponentScope = .shared,
        type: T.Type = T.self,
        tag: DependencyTag? = nil,
        factory: @escaping (A, B) throws -> T
    ) -> Definition<T, (A, B)> {
        return DipCore.container.register(
            scope,
            type: type,
            tag: tag,
            factory: factory)
    }

    @discardableResult
    static func register<T, A, B, C>(
        _ scope: ComponentScope = .shared,
        type: T.Type = T.self,
        tag: DependencyTagConvertible? = nil,
        factory: @escaping (A, B, C) throws -> T
    ) -> Definition<T, (A, B, C)> {
        return DipCore.container.register(
            scope,
            type: type,
            tag: tag,
            factory: factory)
    }

    @discardableResult
    static func register<T, A, B, C, D>(
        _ scope: ComponentScope = .shared,
        type: T.Type = T.self,
        tag: DependencyTagConvertible? = nil,
        factory: @escaping (A, B, C, D) throws -> T
    ) -> Definition<T, (A, B, C, D)> {
        return DipCore.container.register(
            scope,
            type: type,
            tag: tag,
            factory: factory)
    }

    @discardableResult
    static func register<T, A, B, C, D, E>(
        _ scope: ComponentScope = .shared,
        type: T.Type = T.self,
        tag: DependencyTagConvertible? = nil,
        factory: @escaping (A, B, C, D, E) throws -> T
    ) -> Definition<T, (A, B, C, D, E)> {
        return DipCore.container.register(
            scope,
            type: type,
            tag: tag,
            factory: factory)
    }

    @discardableResult
    static func register<T, A, B, C, D, E, F>(
        _ scope: ComponentScope = .shared,
        type: T.Type = T.self,
        tag: DependencyTagConvertible? = nil,
        factory: @escaping (A, B, C, D, E, F) throws -> T
    ) -> Definition<T, (A, B, C, D, E, F)> {
        return DipCore.container.register(
            scope,
            type: type,
            tag: tag,
            factory: factory)
    }
}
// swiftlint:enable large_tuple
