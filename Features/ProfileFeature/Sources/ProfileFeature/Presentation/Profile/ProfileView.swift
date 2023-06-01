//
//  SwiftUIView.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import Combine
import SwiftUI

struct ProfileView: View {

    @ObservedObject
    var viewModel: ProfileViewModel


    var body: some View {
        Text(viewModel.name)
    }
}
