//
//  MainPresenter.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch

protocol MainPresenterProtcol {
    func showAuth()
    func pushAuth()
    func showCard()
}

final class MainPresenter: MainPresenterProtcol {

    private let actionClosure: ActionClosure?

    init(actionClosure: ActionClosure?) {
        self.actionClosure = actionClosure
    }

    func showAuth() {
        actionClosure?(MainAction.showCodeAuth)
    }

    func pushAuth() {
        actionClosure?(MainAction.pushAuth)
    }
    
    func showCard() {
        actionClosure?(MainAction.showCard)
    }
}
