//
//  AuthViewController.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import Foundation
import UIKit

protocol AuthPhoneViewControllerProtocol: UIViewController {}

final class AuthPhoneViewController: UIViewController, AuthPhoneViewControllerProtocol {

    private let presenter: AuthPhonePresenterProtocol

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
    }

    init(presenter: AuthPhonePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
