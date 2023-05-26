//
//  SwiftUIView.swift
//  
//
//  Created by Андрей Коноплев on 26.05.2023.
//

import SwiftUI

extension Auth.Code {
    struct ViewSui: View {

        @ObservedObject
        var viewModel: ViewModel

        var body: some View {
            Text(viewModel.phone)
            Button("Заканчиваем") {
                viewModel.didFinishAuth()
            }
        }
    }
}

