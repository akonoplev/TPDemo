//
//  CardPresenter.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch

protocol CardPresenterProtcol {
    func back()
}

final class CardPresenter: CardPresenterProtcol {

    private let actionClosure: ActionClosure?

    init(actionClosure: ActionClosure?) {
        self.actionClosure = actionClosure
    }
    
    func back() {
        actionClosure?(CardAction.back)
    }
}
