//
//  Dependency.swift
//  Technopark
//
//  Created by Semyon Baryshev on 06.08.2021.
//  Copyright © 2021 Technopark. All rights reserved.
//

import Foundation

public enum Dependency {

    public static func reset() {
        DipCore.container.reset()
    }

    public static func resolve<T>() -> T {
        do {
            return try DipCore.container.resolve()
        } catch {
            fatalError("Can't create \(T.self) error: \(error)")
        }
    }

    public static func resolve<T>(tag: DependencyTag) -> T {
        do {
            return try DipCore.container.resolve(tag: tag)
        } catch {
            fatalError("Can't create \(T.self) error: \(error)")
        }
    }

    public static func resolve<T, A>(arguments arg1: A) -> T {
        do {
            return try DipCore.container.resolve(arguments: arg1)
        } catch {
            fatalError("Can't create \(T.self) error: \(error)")
        }
    }

    public static func resolve<T, A, B>(arguments arg1: A, _ arg2: B) -> T {
        do {
            return try DipCore.container.resolve(arguments: arg1, arg2)
        } catch {
            fatalError("Can't create \(T.self) error: \(error)")
        }
    }

    public static func resolve<T, A, B, C>( arguments arg1: A, _ arg2: B, _ arg3: C) -> T {
        do {
            return try DipCore.container.resolve(arguments: arg1, arg2, arg3)
        } catch {
            fatalError("Can't create \(T.self) error: \(error)")
        }
    }

    public static func resolve<T, A, B, C, D>(arguments arg1: A, _ arg2: B, _ arg3: C, _ arg4: D) -> T {
        do {
            return try DipCore.container.resolve(arguments: arg1, arg2, arg3, arg4)
        } catch {
            fatalError("Can't create \(T.self) error: \(error)")
        }
    }

    // swiftlint:disable:next function_parameter_count
    public static func resolve<T, A, B, C, D, E>(
        arguments arg1: A,
        _ arg2: B,
        _ arg3: C,
        _ arg4: D,
        _ arg5: E
    ) -> T {
        do {
            return try DipCore.container.resolve(arguments: arg1, arg2, arg3, arg4, arg5)
        } catch {
            fatalError("Can't create \(T.self) error: \(error)")
        }
    }

    // swiftlint:disable:next function_parameter_count
    public static func resolve<T, A, B, C, D, E, F>(
        arguments arg1: A,
        _ arg2: B,
        _ arg3: C,
        _ arg4: D,
        _ arg5: E,
        _ arg6: F
    ) -> T {
        do {
            return try DipCore.container.resolve(arguments: arg1, arg2, arg3, arg4, arg5, arg6)
        } catch {
            fatalError("Can't create \(T.self) error: \(error)")
        }
    }

    public static func resolve<T, A>(tag: DependencyTag, arguments arg1: A) -> T {
        do {
            return try DipCore.container.resolve(tag: tag, arguments: arg1)
        } catch {
            fatalError("Can't create \(T.self) error: \(error)")
        }
    }
}
