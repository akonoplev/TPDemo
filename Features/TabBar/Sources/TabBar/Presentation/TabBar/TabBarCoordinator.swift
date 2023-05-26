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
    
    // TODO: Сделать наследников BaseCoordinator типа TabbarCoordinator с заготовленным рутовым контроллером
    // По аналогии сделать NavigationCoordinator и ModalCoordinator. Мб еще WindowCoordinator какой-нибудь
    // Или с любым другом типом представления. Даже можно попробовать SUICoordinator, который через
    // HostingController открывает SUI контент

    override public func make() -> BasePresentableCollection<UIViewController>? {
        guard let mainController = assembly?.outputRoutes.mainCoordinator().root else {
            return nil
        }

        return .init(items: [mainController])
    }
}
