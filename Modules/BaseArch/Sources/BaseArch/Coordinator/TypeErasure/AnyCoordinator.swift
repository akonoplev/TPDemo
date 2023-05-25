//
//  AnyCoordinator.swift
//  
//
//  Created by Daniil on 25.05.2023.
//

import UIKit

// MARK: - AnyCoordinator

public class AnyCoordinator<Root: RootController>: CoreCoordinator {
    // MARK: Lifecycle

    init<MapperType: CoreCoordinator>(_ mapper: MapperType) where MapperType.Root == Root {
        _box = _CoordinatorBox(mapper)
    }

    public init() {
        _box = nil
    }

    // MARK: Public

    public var root: Root? {
        get {
            _box?.root
        }
        set {
            _box?.root = newValue
        }
    }

    public func make() -> Root.Module? {
        _box?.make()
    }

    public func isEqual(other: Coordinator) -> Bool {
        _box?.isEqual(other: other) ?? false
    }

    // MARK: Private

    private let _box: _AnyCoordinatorBox<Root>?
}

// MARK: - _AnyCoordinatorBox

private class _AnyCoordinatorBox<Root: RootController>: CoreCoordinator {
    var root: Root?

    func make() -> Root.Module? {
        fatalError("This method is abstract")
    }

    func isEqual(other _: Coordinator) -> Bool {
        fatalError("This method is abstract")
    }
}

// MARK: - _CoordinatorBox

private class _CoordinatorBox<Base: CoreCoordinator>: _AnyCoordinatorBox<Base.Root> {
    // MARK: Lifecycle

    init(_ base: Base) {
        _base = base
    }

    // MARK: Internal

    typealias Root = Base.Root

    override var root: Base.Root? {
        get {
            _base.root
        }
        set {
            _base.root = newValue
        }
    }

    override func make() -> Base.Root.Module? {
        _base.make()
    }

    override func isEqual(other: Coordinator) -> Bool {
        _base.isEqual(other: other)
    }

    // MARK: Private

    private let _base: Base
}
