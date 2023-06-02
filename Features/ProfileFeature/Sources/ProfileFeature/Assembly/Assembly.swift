//
//  Assembly.swift
//  
//
//  Created by Daniil on 24.05.2023.
//

import BaseArch
import DipCore

public final class Assembly {
    public init(dependencies: Dependencies, outputRoutes: OutputRoutes, resolver: ResolverProtocol) {
        self.dependencies = dependencies
        self.outputRoutes = outputRoutes
        self.resolver = resolver

        registerModules()
    }

    let dependencies: Dependencies
    let outputRoutes: OutputRoutes
    public let resolver: ResolverProtocol

    func registerModules() {
        registerProfile()
    }
}
