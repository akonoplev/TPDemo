//
//  AppAssembly.swift
//  TPDemo
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import DipCore
import AuthorizationFeature
import MainFeature
import ProfileFeature
import TabBar

final class Assembly {
    init() {
        register()
        setup()
    }
    
    func setup() {
        tabBarAssembly = TabBar.Assembly.init(dependencies: self, outputRoutes: appCoordinator)
        mainAssembly = MainFeature.Assembly.init(dependencies: self, outputRoutes: appCoordinator)
        profileAssembly = ProfileFeature.Assembly.init(dependencies: self, outputRoutes: appCoordinator)
        authorizationAssembly = AuthorizationFeature.Assembly.init(dependencies: self, outputRoutes: appCoordinator)
    }
    
    internal var tabBarAssembly: TabBar.Assembly?
    internal var mainAssembly: MainFeature.Assembly?
    internal var profileAssembly: ProfileFeature.Assembly?
    internal var authorizationAssembly: AuthorizationFeature.Assembly?

    internal lazy var appCoordinator: AppCoordinator = AppCoordinator(assembly: self, context: .init(), storage: Dependency.resolve())
    
    private func register() {
        registerManagers()
        registerNavigation()
    }
}
