//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import Combine
import SwiftUI

final class ProfileViewModel: ObservableObject {

    @Published
    var name: String = ""

    private var actionClosure: ActionClosure?

    init(name: String, actionClosure: ActionClosure?) {
        self.name = name
        self.actionClosure = actionClosure
    }
    
}
