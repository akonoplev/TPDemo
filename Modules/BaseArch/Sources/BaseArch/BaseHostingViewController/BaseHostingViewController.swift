//
//  BaseHostingViewController.swift
//  
//
//  Created by Daniil on 31.05.2023.
//

import SwiftUI
import UIKit

open class BaseHostingViewController<Content: View>: UIHostingController<Content>, TransitionableController {
    public init(rootView: Content, title: String) {
        super.init(rootView: rootView)
        self.title = title
    }

    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("Base hosting VC was deinited")
    }

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
