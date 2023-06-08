//
//  BaseViewController.swift
//  
//
//  Created by Daniil on 07.06.2023.
//

import UIKit

open class BaseViewController: UIViewController, TransitionableController {
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        isTransitionComplete = false
    }

    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        isTransitionComplete = true
    }

    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        isTransitionComplete = false
    }

    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        isTransitionComplete = true
    }

    var isTransitionComplete: Bool = false
}
