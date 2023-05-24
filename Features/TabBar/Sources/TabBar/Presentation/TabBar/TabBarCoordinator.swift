//
//  TabBarCoordinator.swift
//
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import UIKit

public protocol TabBarCoordinatorProtocol: CoordinatorProtocol {

}

final class TabBarCoordinator: BaseCoordinator<Assembly, BaseCoordinatorContext>, TabBarCoordinatorProtocol {

     
    init(
        navigationController: UINavigationController,
        assembly: Assembly,
        context: BaseCoordinatorContext,
        storage: CoordinatorActionHandlerStorageProtocol
    ) {
        self.navigationController = navigationController
        super.init(assembly: assembly, context: context, storage: storage)
        
        setupTabBar()
    }
    
    // TODO: Сделать наследников BaseCoordinator типа TabbarCoordinator с заготовленным рутовым контроллером
    // По аналогии сделать NavigationCoordinator и ModalCoordinator. Мб еще WindowCoordinator какой-нибудь
    // Или с любым другом типом представления. Даже можно попробовать SUICoordinator, который через
    // HostingController открывает SUI контент
    let tabBarController = UITabBarController()
    
    private let navigationController: UINavigationController

    override func start() {
        navigationController.setViewControllers([tabBarController], animated: false)
    }

    private func setupTabBar() {
        let controllerForTabBar = UIViewController()
        controllerForTabBar.view.backgroundColor = .red
        controllerForTabBar.tabBarItem = .init(title: "TEST", image: nil, tag: 0)
        tabBarController.viewControllers = [
            controllerForTabBar
        ]
    }
}
