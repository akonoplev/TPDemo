//
//  MainPresenter.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch

protocol MainPresenterProtcol {
    func showAuth()
}

final class MainPresenter: MainPresenterProtcol {

    private let actionClosure: ActionClosure?

    init(actionClosure: ActionClosure?) {
        self.actionClosure = actionClosure
    }

    func showAuth() {
        actionClosure?(MainAction.didTapToButton)
    }
}
