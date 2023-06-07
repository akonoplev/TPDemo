//
//  FinishContext.swift
//  
//
//  Created by Daniil on 07.06.2023.
//

import Foundation

public struct FinishContext {
    public let animated: Bool
    public let completion: (() -> Void)?

    public init(animated: Bool, completion: (() -> Void)?) {
        self.animated = animated
        self.completion = completion
    }
}
