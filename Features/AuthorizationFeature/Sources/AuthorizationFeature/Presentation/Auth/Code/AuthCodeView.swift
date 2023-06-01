//
//  File.swift
//  
//
//  Created by Daniil on 31.05.2023.
//

import SwiftUI

struct AuthCodeView: View {
    
    @ObservedObject
    var viewModel: AuthCodeViewModel
    
    var body: some View {
        Text(viewModel.phone)
        Button("Изменить телефон") {
            viewModel.changePhone()
        }
        Spacer(minLength: 50)
        Button("Заканчиваем") {
            viewModel.didFinishAuth()
        }
    }
}
