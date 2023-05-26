//
//  MainPresenter.swift
//
//
//  Created by Андрей Коноплев on 22.05.2023.
//

@_exported import BaseArch

protocol MainPresenterProtcol {
    func showAuth()
}

extension MainPage {
    final class Presenter: MainPresenterProtcol {

        private let actionClosure: ActionClosure?

        init(actionClosure: ActionClosure?) {
            self.actionClosure = actionClosure
        }

        func showAuth() {
            self.actionClosure?(Action.showAuth)
        }
    }
}

