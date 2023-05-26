//
//  MainPresenter.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

@_exported import BaseArch

protocol MainPresenterProtcol {
    func showAuth()
    func showTabBar() 
}

final class MainPresenter: MainPresenterProtcol {

    private let actionClosure: ActionClosure?

    init(actionClosure: ActionClosure?) {
        self.actionClosure = actionClosure
    }

    func showAuth() {
        actionClosure?(Action.showAuth)
    }


    func showTabBar() {
        actionClosure?(Action.tabBar)
    }
}
