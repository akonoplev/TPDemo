//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 26.05.2023.
//

import BaseArch
import DipCore
import SwiftUI
import UIKit

protocol AuthCodeBuilderProtocol {
    func build() -> UIViewController
}

extension Auth.Code {
    class Builder: AuthCodeBuilderProtocol {
        private let context: Context
        private let actionClosure: ActionClosure?
        private let service1: String
        private let service2: String

        init(context: Context,
             service1: String,
             service2: String,
             actionClosure: ActionClosure?) {
            self.context = context
            self.service1 = service1
            self.service2 = service2
            self.actionClosure = actionClosure
        }

        func build() -> UIViewController {
            let viewModel = ViewModel(phone: context.phone,
                                      service1: service1,
                                      service2: service2,
                                      actionClosure: actionClosure)
            let view = ViewSui(viewModel: viewModel)
            return BaseHostingViewController(rootView: view, title: "Код")
        }
    }
}
