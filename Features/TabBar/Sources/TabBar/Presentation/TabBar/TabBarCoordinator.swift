//
//  TabBarCoordinator.swift
//
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import UIKit

public protocol TabBarCoordinatorProtocol {
    var anyCoordinator: AnyCoordinator<UITabBarController> { get }
}

public final class TabBarCoordinator: TabbarCoordinator<Assembly, BaseCoordinatorContext>, TabBarCoordinatorProtocol {
    public override func start() {
        guard
            let assembly = assembly,
            let mainCoordinator = assembly.outputRoutes.mainCoordinator(),
            let profileCoordinator = assembly.outputRoutes.profileCoordinator()
        else {
            return
        }

        mainCoordinator.root?.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "m.square.fill"), tag: 0)
        profileCoordinator.root?.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.fill"), tag: 1)

        set(modules: [mainCoordinator, profileCoordinator], animated: false)
    }
}
