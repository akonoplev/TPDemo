//
//  BaseHostingViewController.swift
//  
//
//  Created by Daniil on 31.05.2023.
//

import SwiftUI
import UIKit

open class BaseHostingViewController<Content: View>: UIHostingController<Content> {
    public init(rootView: Content, title: String) {
        super.init(rootView: rootView)
        self.title = title
    }

    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
