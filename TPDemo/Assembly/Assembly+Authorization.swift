//
//  Assembly+Authorization.swift
//  TPDemo
//
//  Created by Daniil on 24.05.2023.
//

import AuthorizationFeature
import BaseArch
import SuperCore
import UIKit

extension Assembly: AuthorizationFeature.Dependencies {
    // MARK: - integration of Auth feature module
    func authCoordinator(finish: @escaping VoidClosure) -> AnyCoordinator<UINavigationController>? {

        assembly?.authorizationAssembly.resolver.authCodeCoordinator(phone: "88005553535",
                                                                     finish: finish).anyCoordinator
    }
}
