//
//  File 2.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import Foundation
import BaseArch

protocol AuthCodePresenterProtcol {}

final class AuthCodePresenter: AuthPresenterProtcol {
    
    private let actionClosure: ActionClosure?

    init(actionClosure: ActionClosure?) {
        self.actionClosure = actionClosure
    }
    
}
