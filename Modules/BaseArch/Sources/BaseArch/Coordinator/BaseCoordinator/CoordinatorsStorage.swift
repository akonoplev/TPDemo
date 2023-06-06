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
        var modules: [CorePresentable?]
    }

    func save(coordinator: Coordinator, modules: [CorePresentable]?) {
        // Подчистка несуществующих координаторов
        prepare()

        // Непоказываемый вариант координатора, пока не актуально
//        if coordinator is AnyCoordinator<DemonRootController> {
//            return
//        }

        if let modules = modules {
            // Проверка на повторный старт координатора
            if let index = cache.firstIndex(where: { $0.coordinator === coordinator }) {
                cache[index].modules = modules
            } else {
                cache.append(Item(coordinator: coordinator, modules: modules))
            }
        }
    }

    func modules(for coordinator: Coordinator) -> [CorePresentable?] {
        cache.first(where: { $0.coordinator.isEqual(other: coordinator) })?.modules ?? []
    }

    // MARK: Private

    private var cache: [Item] = []

    private func prepare() {
        cache = cache.filter {
            if $0.modules.isEmpty {
                return false
            }

            // Пока неактуально. В СМ любой контроллер является TransitionableController, что позволяет убеждаться в том, что его показ завершен(контроллер прошел стадию didAppear или didDisappear)
//            if let viewController = $0.module as? (UIViewController & TransitionableController), viewController.isTransitionComplete {
//                let isViewNotLoaded = !viewController.isViewLoaded
//                let isPresented = viewController.presentingViewController != nil
//                let hasParent = viewController.parent != nil
//
//                let isRootViewController = UIApplication.shared.windows.contains {
//                    viewController === $0.rootViewController
//                }
//
//                return [isViewNotLoaded, isPresented, hasParent, isRootViewController].contains(true)
//            }

            return true
        }
    }
}
