//
//  Assembly.swift
//  
//
//  Created by Daniil on 24.05.2023.
//

import DipCore
import Foundation

public final class Assembly {
    public init(dependencies: Dependencies, outputRoutes: OutputRoutes) {
        self.dependencies = dependencies
        self.outputRoutes = outputRoutes

        registerModules()
    }

    let dependencies: Dependencies
    let outputRoutes: OutputRoutes

    private func registerModules() {
        registerMain()
    }
}
