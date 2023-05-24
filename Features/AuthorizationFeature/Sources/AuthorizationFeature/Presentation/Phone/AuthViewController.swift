//
//  AuthViewController.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import Foundation
import UIKit

protocol AuthViewControllerProtocol: UIViewController {

}

final class AuthViewController: UIViewController, AuthViewControllerProtocol {

    private let presenter: AuthPresenterProtcol

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    init(presenter: AuthPresenterProtcol) {
        self.presenter = presenter
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
