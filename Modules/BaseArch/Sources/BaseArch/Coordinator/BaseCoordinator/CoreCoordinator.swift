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
    var finish: ((_ context: FinishContext?) -> Void)? { get set }

    func start()
}

public extension CoreCoordinator {
    func activate(child: Root.Child) {
        CoordinatorsStorage.shared.save(coordinator: self, childs: [child])
    }

    func activate(childs: [Root.Child]?) {
        guard let childs = childs else {
            return
        }

        CoordinatorsStorage.shared.save(coordinator: self, childs: childs)
    }

    func start(on container: Root) {
        set(container: container)

        start()
    }

    func set(container: Root) {
        root = container
    }
}
