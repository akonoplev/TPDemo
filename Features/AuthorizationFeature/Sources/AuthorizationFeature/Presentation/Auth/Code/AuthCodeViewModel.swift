//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import Foundation

extension Auth.Code {
    final class ViewModel: ObservableObject {
        @Published
        var phone: String

        private let service1: String
        private let service2: String
        private let actionClosure: ActionClosure?

        init(
            phone: String,
            service1: String,
            service2: String,
            actionClosure: ActionClosure?
        ) {
            self.phone = phone
            self.service1 = service1
            self.service2 = service2
            self.actionClosure = actionClosure
        }

        func didFinishAuth() {
            self.actionClosure?(Action.didAuth)
        }

        func changePhone() {
            self.actionClosure?(Action.changePhone)
        }
    }
}

