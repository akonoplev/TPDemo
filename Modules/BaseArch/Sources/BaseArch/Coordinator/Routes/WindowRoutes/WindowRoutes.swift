//
//  File.swift
//  
//
//  Created by Daniil on 01.06.2023.
//

import UIKit

// MARK: - WindowRoutes

public protocol WindowRoutes: CoreCoordinator {
    var window: UIWindow? { get }
}

public extension WindowRoutes {
    func show(viewController: UIViewController) where Root.Child == UIViewController {
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()

        activate(child: viewController)
    }

    func show<Coordinator: CoreCoordinator>(
        coordinator: Coordinator
    ) where Coordinator.Root: UIViewController {
        window?.rootViewController = coordinator.root
        window?.makeKeyAndVisible()

        coordinator.navigationType = .window

        coordinator.start()
    }

    func replaceWith<Coordinator: CoreCoordinator>(
        coordinator: Coordinator,
        transition: WindowTransition
    ) where Coordinator.Root: UIViewController {
        guard let window = window, let destionationVC = coordinator.root else {
            return
        }

        switch transition {
        case .none:
            updateWithoutAnimation(window: window, destinationVC: destionationVC)
        case .fade:
            updateWithFadeAnimation(window: window, destinationVC: destionationVC)
        case .push:
            updateWithPushAnimation(window: window, destinationVC: destionationVC)
        }

        coordinator.navigationType = .window
        coordinator.start()
    }

    private func updateWithoutAnimation(window: UIWindow, destinationVC: UIViewController) {
        window.rootViewController = destinationVC
        window.makeKeyAndVisible()
    }

    private func updateWithFadeAnimation(window: UIWindow, destinationVC: UIViewController) {
        window.fadeTransition(duration: .normal)
        updateWithoutAnimation(window: window, destinationVC: destinationVC)
    }

    private func updateWithPushAnimation(window: UIWindow, destinationVC: UIViewController) {
        // Фильтруем переходы на пустые UINavigationController
        if (destinationVC as? UINavigationController)?.viewControllers.isEmpty == true {
            return
        }

        let options: WindowTransitionOptions = .init()
        var backgroundWindow: BackgroundWindow?

        if window.rootViewController != nil, UIView.areAnimationsEnabled {
            if let backgroundColor = options.backgroundColor {
                backgroundWindow = BackgroundWindow(frame: window.frame)
                backgroundWindow?.backgroundColor = backgroundColor
                backgroundWindow?.makeKeyAndVisible()
            }

            let animation = options.animation
            animation.delegate = backgroundWindow
            window.layer.add(animation, forKey: kCATransition)
        }

        window.rootViewController = destinationVC
        window.makeKeyAndVisible()
    }
}
