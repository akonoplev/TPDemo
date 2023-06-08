//
//  AppCoordinator.swift
//  TPDemo
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import MainFeature
import TabBar
import AuthorizationFeature
import ProfileFeature

import BaseArch
import DipCore
import Foundation
import SuperCore
import TabBar
import UIKit

final class AppCoordinator: WindowCoordinator<Assembly, BaseCoordinatorContext> {
    override func start() {
        guard let assembly = assembly else {
            return
        }

        let tabBarCoordinator = assembly.tabBarAssembly.resolver.tabBarCoordinator()
        let tabBarController: UITabBarController = assembly.resolver.rootTabBarController()

        tabBarCoordinator.anyCoordinator.set(container: tabBarController)

        show(coordinator: tabBarCoordinator.anyCoordinator)
    }

    // MARK: - integration of Auth feature module

    func fullScreenAuthCoordinator() -> AnyCoordinator<UINavigationController>? {
        authCoordinator(presentType: .fullScreen)
    }

    func sheetAuthCoordinator() -> AnyCoordinator<UINavigationController>? {
        authCoordinator(presentType: .bottomSheet(context: .cart))
    }

    private func authCoordinator(presentType: PresentType<SheetType>) -> AnyCoordinator<UINavigationController>? {
        assembly?.authorizationAssembly.resolver.authCodeCoordinator(phone: "88005553535", presentType: presentType).anyCoordinator
    }
    
    // MARK: - integration of Main feature module
    
    func mainCoordinator() -> AnyCoordinator<UINavigationController>? {
        guard let assembly = assembly else {
            return nil
        }

        let mainCoordinator = assembly.mainAssembly.resolver.mainCoordinator()

        mainCoordinator.anyCoordinator.set(container: assembly.resolver.mainNavigationController())

        return mainCoordinator.anyCoordinator
    }
    
    // MARK: - integration of Profile feature module

    func profileCoordinator() -> AnyCoordinator<UINavigationController>? {
        guard let assembly = assembly else {
            return nil
        }

        let profileCoordinator = assembly.profileAssembly.resolver.profileCoordinator(name: "Ваше имя: Форрест Гамп").anyCoordinator

        profileCoordinator.anyCoordinator.set(container: assembly.resolver.profileNavigationController())

        return profileCoordinator.anyCoordinator
    }
}

extension AppCoordinator: MainFeature.OutputRoutes
& ProfileFeature.OutputRoutes
& AuthorizationFeature.OutputRoutes
& TabBar.OutputRoutes {}
