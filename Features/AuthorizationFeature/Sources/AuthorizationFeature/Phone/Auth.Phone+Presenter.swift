//
//  AuthPresenterProtocol.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch

protocol AuthPresenterProtcol {
    func showCode()
}

extension Auth.Phone {
    final class Presenter: AuthPresenterProtcol {

        private let actionClosure: ActionClosure?

        init(actionClosure: ActionClosure?) {
            self.actionClosure = actionClosure
        }

        deinit {
            print("xxx")
        }

        func showCode() {
            self.actionClosure?(Action.showCode(phone: "+79636342477"))
        }
    }
}

