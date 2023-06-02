//
//  AppAssembly.swift
//  TPDemo
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import DipCore
import AuthorizationFeature
import MainFeature
import ProfileFeature
import TabBar

final class Assembly {
    init() {
        register()
    }

    internal lazy var tabBarAssembly = TabBar.Assembly.init(dependencies: self, outputRoutes: appCoordinator, resolver: resolver)
    internal lazy var mainAssembly = MainFeature.Assembly.init(dependencies: self, outputRoutes: appCoordinator, resolver: resolver)
    internal lazy var profileAssembly = ProfileFeature.Assembly.init(dependencies: self, outputRoutes: appCoordinator, resolver: resolver)
    internal lazy var authorizationAssembly = AuthorizationFeature.Assembly.init(dependencies: self, outputRoutes: appCoordinator, resolver: resolver)

    internal lazy var appCoordinator: AppCoordinator = AppCoordinator(assembly: self, context: .init(), storage: Dependency.resolve())
    internal lazy var resolver: ResolverProtocol = {
        Dependency.resolve()
    }()
    
    private func register() {
        registerResolver()
        registerManagers()
        registerNavigation()
    }
}
