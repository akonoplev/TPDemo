//
//  ProfileBuilder.swift
//  
//
//  Created by Daniil on 01.06.2023.
//

import BaseArch
import DipCore
import SwiftUI
import UIKit

protocol ProfileBuilderProtocol: BuilderProtocol {}

final class ProfileBuilder: BaseBuilder<ProfileCoordinator.Context>, ProfileBuilderProtocol {
    override func build() -> UIViewController {
        let viewModel = ProfileViewModel(name: context.name, actionClosure: actionClosure)
        let view = ProfileView(viewModel: viewModel)
        return BaseHostingViewController(rootView: view, title: "Профиль")
    }
}
