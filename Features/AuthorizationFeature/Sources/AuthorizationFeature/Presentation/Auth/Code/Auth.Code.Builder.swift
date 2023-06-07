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

extension Auth.Code {
    final class Builder: BaseBuilder<Auth.Code.Context>, AuthCodeBuilderProtocol {
        deinit {
            print("Auth code builder was deinited")
        }

        override func build() -> UIViewController {
            let viewModel = Auth.Code.ViewModel(phone: context.phone,
                                      service1: "", // здесь будет что-то типа resolver.service1()
                                      service2: "", // здесь будет что-то типа resolver.service2()
                                      actionClosure: actionClosure)
            let view = Auth.Code.CodeView(viewModel: viewModel)
            return BaseHostingViewController(rootView: view, title: "Код")
        }
    }
}

