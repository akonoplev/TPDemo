//
//  File.swift
//  
//
//  Created by Daniil on 31.05.2023.
//

import SwiftUI

extension Auth.Code {
    struct CodeView: View {

        @ObservedObject
        var viewModel: ViewModel

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
}

