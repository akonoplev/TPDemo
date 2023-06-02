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
        weak var module: CorePresentable?
    }

    func save(coordinator: Coordinator, module: CorePresentable?) {
        // Подчистка несуществующих координаторов
        prepare()

        if module is Coordinator {
            return
        }

        // Непоказываемый вариант координатора, пока не актуально
//        if coordinator is AnyCoordinator<DemonRootController> {
//            return
//        }

        if let module = module {
            let newItem = Item(coordinator: coordinator, module: module)

            // Проверка на повторный старт координатора
            if let index = cache.firstIndex(where: { $0.coordinator === coordinator }) {
                cache[index] = newItem
            } else {
                cache.append(Item(coordinator: coordinator, module: module))
            }
        }
    }

    func module(for coordinator: Coordinator) -> CorePresentable? {
        cache.first(where: { $0.coordinator.isEqual(other: coordinator) })?.module
    }

    // MARK: Private

    private var cache: [Item] = []

    private func prepare() {
        cache = cache.filter {
            if $0.module == nil {
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
