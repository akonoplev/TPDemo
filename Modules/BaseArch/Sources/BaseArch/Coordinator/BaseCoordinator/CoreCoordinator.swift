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

    func start()
}

public extension CoreCoordinator {
    func activate(container: Root.Module) {
        CoordinatorsStorage.shared.save(coordinator: self, modules: [container])
    }

    func activate(containers: [Root.Module]) {
        CoordinatorsStorage.shared.save(coordinator: self, modules: containers)
    }

    /// Вызывать у стартуемого координатора
    /// container - rootController, на котором происходит запуск
    func start(on container: Root?) {
        guard let container = container else {
            return
        }

        root = container

        start()
    }

    /// Вызывает стартуемый coordinator из контекста другого coordinator
    /// Передает root автоматически из текущего координатора
    func start<Coordinator: CoreCoordinator>(
        coordinator: Coordinator,
        animated: Bool
    ) where Coordinator.Root == Root {
        coordinator.root = root

        coordinator.start()
    }

    /// Вызывает стартуемый coordinator на передаваемом container
    /// container - rootController, на котором происходит запуск
    func start<Coordinator: CoreCoordinator>(
        coordinator: Coordinator,
        container: Coordinator.Root?,
        animated: Bool
    ) {
        guard let container = container else {
            return
        }

        coordinator.root = container

        coordinator.start()
    }

    func set(container: Root) {
        root = container
    }
}
