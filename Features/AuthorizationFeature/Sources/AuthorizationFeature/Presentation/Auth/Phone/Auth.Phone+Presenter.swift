//
//  AuthPhonePresenter.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch

protocol AuthPhonePresenterProtocol {
    func back()
}

extension Auth.Phone {
    final class Presenter: AuthPhonePresenterProtocol {

        private let actionClosure: ActionClosure?

        init(actionClosure: ActionClosure?) {
            self.actionClosure = actionClosure
        }
        
        func back() {
            actionClosure?(Action.back)
        }
    }
}

