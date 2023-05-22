//
//  AuthPresenterProtocol.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch

protocol AuthPresenterProtcol {}

final class AuthPresenter: AuthPresenterProtcol {

    private let actionClosure: ActionClosure?

    init(actionClosure: ActionClosure?) {
        self.actionClosure = actionClosure
    }
}
