//
//  AppAssembly.swift
//  TPDemo
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import AuthorizationFeature
import MainFeature
import ProfileFeature
import TabBar

enum AppAssebly {
    static func setup() {
        AuthAssembly.setup()
        MainAssemly.setup()
        ProfileAssembly.setup()
        TabBarAssembly.setup()
    }
}
