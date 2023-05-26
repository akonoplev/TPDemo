//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import Combine
import SwiftUI

protocol ProfileViewModelProtocol {

}

class ProfileViewModel: ObservableObject, ProfileViewModelProtocol {

    @Published
    var someValue: String = ""

//    private var actionClosure: ActionClosure?
//
//    init(actionClosure: ActionClosure?) {
//        self.actionClosure = actionClosure
//    }
    
}
