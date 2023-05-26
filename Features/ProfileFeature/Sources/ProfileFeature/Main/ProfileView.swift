//
//  SwiftUIView.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import Combine
import SwiftUI
import UIKit

struct ProfileView: View {

   // @ObservedObject
    var viewModel: ProfileViewModelProtocol


    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


class Router {
    enum Destination {
        case uikitViewController
        case swiftUIView
    }

    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func navigate(to destination: Destination) {
        switch destination {
        case .uikitViewController:
            let viewController = UIViewController()
            navigationController.pushViewController(viewController, animated: true)

        case .swiftUIView:
            let swiftUIView =  Text("Hello World")
            let viewController = UIHostingController(rootView: swiftUIView)
            navigationController.pushViewController(viewController, animated: true)
        }
    }
}
