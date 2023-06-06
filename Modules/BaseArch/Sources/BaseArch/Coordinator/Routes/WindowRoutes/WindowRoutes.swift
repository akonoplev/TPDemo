//
//  File.swift
//  
//
//  Created by Daniil on 01.06.2023.
//

import UIKit

// MARK: - WindowRoutes

public protocol WindowRoutes {
    var window: UIWindow? { get }
}

public extension WindowRoutes {
    func start<Coordinator: CoreCoordinator>(
        coordinator: Coordinator
    ) where Coordinator.Root: UIViewController {
        window?.rootViewController = coordinator.root
        window?.makeKeyAndVisible()

        coordinator.start()
    }
    
    // Все что ниже проверить

    func replaceWith<Coordinator: CoreCoordinator>(
        coordinator: Coordinator,
        transition: WindowTransition
    ) where Coordinator.Root: UIViewController {
        guard let window = window, let destionationVC = coordinator.root else {
            return
        }

        switch transition {
        case .none:
            updateWithoutAnimation(window: window, destionationVC: destionationVC)
        case .fade:
            updateWithFadeAnimation(window: window, destionationVC: destionationVC)
        case .push:
            updateWithPushAnimation(window: window, destionationVC: destionationVC)
        }
    }

    private func updateWithoutAnimation(window: UIWindow, destionationVC: UIViewController) {
        window.rootViewController = destionationVC
        window.makeKeyAndVisible()
    }

    private func updateWithFadeAnimation(window: UIWindow, destionationVC: UIViewController) {
        window.fadeTransition(duration: .normal)
        updateWithoutAnimation(window: window, destionationVC: destionationVC)
    }

    private func updateWithPushAnimation(window: UIWindow, destionationVC: UIViewController) {
        // Фильтруем переходы на пустые UINavigationController
        if (destionationVC as? UINavigationController)?.viewControllers.isEmpty == true {
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

        window.rootViewController = destionationVC
        window.makeKeyAndVisible()
    }
}
