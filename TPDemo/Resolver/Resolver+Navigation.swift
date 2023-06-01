//
//  Resolver+Navigation.swift
//  TPDemo
//
//  Created by Daniil on 31.05.2023.
//

import BaseArch
import DipCore
import UIKit

extension ResolverProtocol {
    func rootTabBarController() -> UITabBarController {
        Dependency.resolve(tag: TabController.root)
    }

    func mainNavigationController() -> UINavigationController {
        Dependency.resolve(tag: Tab.main)
    }

    func profileNavigationController() -> UINavigationController {
        Dependency.resolve(tag: Tab.profile)
    }
}
