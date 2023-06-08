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
    var navigationType: NavigationType { get set }
    var finish: ((_ context: FinishContext?) -> Void)? { get set }

    func start()
}

public extension CoreCoordinator {
    /// Активация(сохранение для текущего координатора передаваемого child)
    func activate(child: CorePresentable) {
        CoordinatorsStorage.shared.save(coordinator: self, childs: [child])
    }

    /// Активация(сохранение для текущего координатора передаваемых childs)
    func activate(childs: [CorePresentable]?) {
        guard let childs = childs else {
            return
        }

        CoordinatorsStorage.shared.save(coordinator: self, childs: childs)
    }

    /// Выставление root у текущего координатора и вызов у него start
    func start(on container: Root) {
        set(container: container)

        start()
    }

    /// Выставление root у текущего координатора
    func set(container: Root) {
        root = container
    }
}
