//
//  AuthViewController.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import Foundation
import UIKit

protocol AuthPhoneViewControllerProtocol: UIViewController {}

extension Auth.Phone {
    final class ViewController: BaseViewController, AuthPhoneViewControllerProtocol {

        private let presenter: AuthPhonePresenterProtocol

        override func viewDidLoad() {
            super.viewDidLoad()

            view.backgroundColor = .darkGray

            let button = UIButton()
            button.backgroundColor = .gray
            button.setTitle("Назад", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(button)

            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 200),
                button.heightAnchor.constraint(equalToConstant: 30),
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
            
            button.addTarget(self, action: #selector(showAuth), for: .touchUpInside)
        }

        @objc func showAuth() {
            presenter.back()
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
}

