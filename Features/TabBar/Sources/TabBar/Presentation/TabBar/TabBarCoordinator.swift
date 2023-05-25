//
//  TabBarCoordinator.swift
//
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import UIKit

public protocol TabBarCoordinatorProtocol: CoreCoordinator {
    var tabBarController: UITabBarController { get }
}

public final class TabBarCoordinator: BaseArch.TabbarCoordinator<Assembly, BaseCoordinatorContext>, TabBarCoordinatorProtocol {
    
    // TODO: Сделать наследников BaseCoordinator типа TabbarCoordinator с заготовленным рутовым контроллером
    // По аналогии сделать NavigationCoordinator и ModalCoordinator. Мб еще WindowCoordinator какой-нибудь
    // Или с любым другом типом представления. Даже можно попробовать SUICoordinator, который через
    // HostingController открывает SUI контент

    public let tabBarController = UITabBarController()

    override public func make() -> BasePresentableCollection<UIViewController>? {
        // добавить отображаемые контроллеры
        let controllerForTabBar = UIViewController()
        controllerForTabBar.view.backgroundColor = .red
        controllerForTabBar.tabBarItem = .init(title: "TEST", image: nil, tag: 0)
        
        return .init(items: [controllerForTabBar])
    }

//    override func start() {
//        navigationController.setViewControllers([tabBarController], animated: false)
//    }

//    private func setupTabBar() {
//        let controllerForTabBar = UIViewController()
//        controllerForTabBar.view.backgroundColor = .red
//        controllerForTabBar.tabBarItem = .init(title: "TEST", image: nil, tag: 0)
//        tabBarController.viewControllers = [
//            controllerForTabBar
//        ]
//    }
}
