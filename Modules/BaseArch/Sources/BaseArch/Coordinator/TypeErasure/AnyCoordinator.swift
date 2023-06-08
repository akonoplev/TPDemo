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

    public var navigationType: NavigationType {
        get {
            _box?.navigationType ?? .navigationStack
        }
        set {
            _box?.navigationType = newValue
        }
    }

    public var finish: ((_ context: FinishContext?) -> Void)? {
        get {
            _box?.finish
        }
        set {
            _box?.finish = newValue
        }
    }

    public func start() {
        _box?.start()
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
    var navigationType: NavigationType = .navigationStack
    var finish: ((_ context: FinishContext?) -> Void)?

    func start() {
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

    override var navigationType: NavigationType {
        get {
            _base.navigationType
        }
        set {
            _base.navigationType = newValue
        }
    }

    override var finish: ((_ context: FinishContext?) -> Void)? {
        get {
            _base.finish
        }
        set {
            _base.finish = newValue
        }
    }

    override func start() {
        _base.start()
    }

    override func isEqual(other: Coordinator) -> Bool {
        _base.isEqual(other: other)
    }

    // MARK: Private

    private let _base: Base
}
