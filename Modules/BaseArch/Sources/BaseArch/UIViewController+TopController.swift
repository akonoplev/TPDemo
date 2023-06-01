//
//  UIViewController+TopController.swift
//  
//
//  Created by Daniil on 01.06.2023.
//

import UIKit

// MARK: - ContainerTopViewController

protocol ContainerTopViewController {
    var currentTopViewController: UIViewController? { get }
}

// MARK: - UINavigationController + ContainerTopViewController

extension UINavigationController: ContainerTopViewController {
    var currentTopViewController: UIViewController? {
        topViewController
    }
}

// MARK: - UITabBarController + ContainerTopViewController

extension UITabBarController: ContainerTopViewController {
    var currentTopViewController: UIViewController? {
        selectedViewController
    }
}

extension UIViewController {
    var lastPresentingViewController: UIViewController? {
        lastNonNilController {
            $0.presentingViewController
        }
    }

    var lastPresentedViewController: UIViewController? {
        lastNonNilController {
            $0.presentedViewController
        }
    }

    var lastPresentingOrSelf: UIViewController {
        lastNonNilControllerOrSelf {
            $0.presentingViewController
        }
    }

    var lastPresentedOrSelf: UIViewController {
        lastNonNilControllerOrSelf {
            $0.presentedViewController
        }
    }

    var isDisplayed: Bool {
        isViewLoaded && view.window != nil
    }

    private func lastNonNilController(withAction action: (UIViewController) -> UIViewController?) -> UIViewController? {
        let result = lastNonNilControllerOrSelf(withAction: action)
        return result != self ? result : nil
    }

    private func lastNonNilControllerOrSelf(withAction action: (UIViewController) -> UIViewController?) -> UIViewController {
        if let next = action(self) {
            return next.lastNonNilControllerOrSelf(withAction: action)
        }

        if let container = self as? ContainerTopViewController {
            if let selectedViewController = container.currentTopViewController {
                return selectedViewController.lastNonNilControllerOrSelf(withAction: action)
            }
        }

        return self
    }
}

public extension UIViewController {
    var topPresentedController: UIViewController? {
        UIViewController.topViewController(for: self)
    }

    var parentController: UIViewController? {
        var presentingViewController = self.presentingViewController

        while let nextController = presentingViewController?.presentingViewController {
            presentingViewController = nextController
        }

        return presentingViewController?.parent
    }

    private static func topViewController(for rootViewController: UIViewController) -> UIViewController? {
        if let presentedViewController = rootViewController.presentedViewController {
            return topViewController(for: presentedViewController)
        }

        if let presentedViewController = rootViewController.parentController?.presentedViewController {
            return topViewController(for: presentedViewController)
        }

        if let topController = (rootViewController as? ContainerTopViewController)?.currentTopViewController {
            return topViewController(for: topController)
        }

        return rootViewController
    }
}
