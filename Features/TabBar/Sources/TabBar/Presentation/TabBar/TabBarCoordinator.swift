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
    override public func make() -> BasePresentableCollection<UIViewController>? {
        guard
            let assembly = assembly,
            let mainController = assembly.outputRoutes.mainCoordinator()?.root,
            let profileController = assembly.outputRoutes.profileCoordinator()?.root
        else {
            return nil
        }
        
        mainController.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "m.square.fill"), tag: 0)
        profileController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.fill"), tag: 1)

        return .init(items: [mainController, profileController])
    }
}
