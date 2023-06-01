//
//  AppCoordinator+Main.swift
//  TPDemo
//
//  Created by Daniil on 24.05.2023.
//

import AuthorizationFeature
import BaseArch
import DipCore
import MainFeature
import SuperCore
import UIKit

extension AppCoordinator: MainFeature.OutputRoutes {
    func authCoordinator(finish: @escaping VoidClosure) -> BaseArch.AnyCoordinator<UINavigationController>? {
        assembly?.authorizationAssembly.resolver.authCodeCoordinator(phone: "88005553535", finish: finish).anyCoordinator
    }
}
