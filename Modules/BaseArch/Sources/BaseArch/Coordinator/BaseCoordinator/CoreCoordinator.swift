//
//  File.swift
//  
//
//  Created by Daniil on 25.05.2023.
//

import UIKit

// MARK: - CoreCoordinator

public protocol CoreCoordinator: Coordinator, CorePresentable {
    associatedtype Root: RootController

    var root: Root? { get set }

    func make() -> Root.Module?
}

public extension CoreCoordinator {
    func activate() -> Root.Module? {
        let module = make()
        CoordinatorsStorage.shared.save(coordinator: self, module: module)
        return module
    }

    func start(on container: Root?, animated: Bool) {
        guard let container = container else {
            return
        }

        root = container

        if let module = activate() {
            container.start(module: module, animated: animated)
        }
    }

    func add(to container: Root?, animated: Bool) {
        guard let container = container else {
            return
        }

        root = container

        if let module = activate() {
            container.add(module: module, animated: animated)
        }
    }

    @discardableResult
    func start<Coordinator: CoreCoordinator>(
        coordinator: Coordinator,
        animated: Bool
    ) -> Coordinator.Root? {
        if let module = coordinator.activate() {
            coordinator.root?.start(module: module, animated: animated)
        }

        return coordinator.root
    }

    func start<Coordinator: CoreCoordinator>(
        coordinator: Coordinator,
        container: Coordinator.Root?,
        animated: Bool
    ) {
        guard let container = container else {
            return
        }

        coordinator.root = container

        if let module = coordinator.activate() {
            container.start(module: module, animated: animated)
        }
    }
}
