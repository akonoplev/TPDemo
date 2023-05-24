//
//  Assembly.swift
//  
//
//  Created by Daniil on 24.05.2023.
//

public final class Assembly {
    public init(dependencies: Dependencies, outputRoutes: OutputRoutes) {
        self.dependencies = dependencies
        self.outputRoutes = outputRoutes
    }
    
    let dependencies: Dependencies
    let outputRoutes: OutputRoutes
}
