//
//  Assembly+Resolver.swift
//  TPDemo
//
//  Created by Daniil on 31.05.2023.
//

import BaseArch
import DipCore

extension Assembly {
    func registerResolver() {
        Dependency.register {
            Resolver()
        }
        .implements(ResolverProtocol.self)
    }
}
