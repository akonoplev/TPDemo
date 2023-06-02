//
//  BaseBuilder.swift
//  
//
//  Created by Daniil on 31.05.2023.
//

import UIKit

open class BaseBuilder<Context>: BuilderProtocol {
    public let context: Context
    public let resolver: ResolverProtocol
    public let actionClosure: ActionClosure?

    public init(context: Context, resolver: ResolverProtocol, actionClosure: ActionClosure?) {
        self.context = context
        self.resolver = resolver
        self.actionClosure = actionClosure
    }

    open func build() -> UIViewController {
        fatalError("The build() method is abstract. Please override him!")
    }
}
