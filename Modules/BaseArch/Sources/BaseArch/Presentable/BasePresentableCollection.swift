//
//  File.swift
//  
//
//  Created by Daniil on 25.05.2023.
//

import Foundation

// Вспомогательная обертка для работы координатора сразу с несколькими экранами
public class BasePresentableCollection<Module: CorePresentable>: CorePresentable {
    // MARK: Lifecycle

    public init(items: [Module]) {
        self.items = items
    }

    // MARK: Public

    public let items: [Module]
}
