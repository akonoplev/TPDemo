//
//  AuthCodeBuilder.swift
//  
//
//  Created by Daniil on 31.05.2023.
//

import BaseArch
import DipCore
import SwiftUI
import UIKit

protocol AuthCodeBuilderProtocol: BuilderProtocol {}

final class AuthCodeBuilder: BaseBuilder<AuthCoordinator.Context>, AuthCodeBuilderProtocol {
    deinit {
        print("Auth code builder was deinited")
    }

    override func build() -> UIViewController {
        let viewModel = AuthCodeViewModel(phone: context.phone,
                                  service1: "", // здесь будет что-то типа resolver.service1()
                                  service2: "", // здесь будет что-то типа resolver.service2()
                                  actionClosure: actionClosure)
        let view = AuthCodeView(viewModel: viewModel)
        return BaseHostingViewController(rootView: view, title: "Код")
    }
}
