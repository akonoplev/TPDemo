//
//  AppAssembly.swift
//  TPDemo
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import AuthorizationFeature
import DipCore
import MainPage
import ProfileFeature
import TabBar

enum AppAssebly {
    static func setup() {

        BaseArchAssembly.setup()

        TabBarAssembly.setup()
        AuthAssembly.setup()
        MainPageAssemly.setup()
        ProfileAssembly.setup()
        TabBarAssembly.setup()
    }
}
