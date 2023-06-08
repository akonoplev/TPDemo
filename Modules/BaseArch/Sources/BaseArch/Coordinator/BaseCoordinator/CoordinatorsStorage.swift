//
//  File.swift
//  
//
//  Created by Daniil on 25.05.2023.
//

import UIKit

// MARK: - CoordinatorsStorage

public class CoordinatorsStorage {
    // MARK: Lifecycle

    private init() {}

    // MARK: Public

    public static let shared = CoordinatorsStorage()

    public func clear() {
        cache = []
    }

    // MARK: Internal

    struct Item {
        let coordinator: Coordinator
        var childs: [WeakWrapper?]
    }

    class WeakWrapper {
        weak var value: CorePresentable?
        init(value: CorePresentable) {
            self.value = value
        }
    }

    func save(coordinator: Coordinator, childs: [CorePresentable]) {
        // Подчистка несуществующих координаторов
        prepare()

        let childs = makeWrappers(from: childs)
        // Проверка на повторный старт координатора
        if let index = cache.firstIndex(where: { $0.coordinator === coordinator }) {
            cache[index].childs = childs
        } else {
            cache.append(Item(coordinator: coordinator, childs: childs))
        }
    }

    func modules(for coordinator: Coordinator) -> [CorePresentable?] {
        guard let childs = cache.first(where: { $0.coordinator.isEqual(other: coordinator) })?.childs else {
            return []
        }

        return makePresentables(from: childs)
    }

    // MARK: Private

    private var cache: [Item] = []

    private func prepare() {
        cache = cache.filter {
            if $0.childs.filter({ $0?.value != nil }).isEmpty {
                return false
            }

            if let viewControllers = $0.childs as? [(UIViewController & TransitionableController)], viewControllers.allSatisfy({ $0.isTransitionComplete }) {
                return viewControllers.map { viewController in
                    let isPresented = viewController.presentingViewController != nil
                    let hasParent = viewController.parent != nil

                    let isRootViewController = UIApplication.shared.windows.contains {
                        viewController === $0.rootViewController
                    }

                    return isPresented || hasParent || isRootViewController
                }
                .contains(true)
            }

            return true
        }
    }

    func makeWrappers(from presentables: [CorePresentable]) -> [WeakWrapper] {
        presentables.map { .init(value: $0) }
    }

    func makePresentables(from wrappers: [WeakWrapper?]) -> [CorePresentable?] {
        wrappers.map { $0?.value }
    }
}
