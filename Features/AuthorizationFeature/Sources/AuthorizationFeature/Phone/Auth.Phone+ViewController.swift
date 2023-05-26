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

extension Auth.Phone {
    final class ViewController: UIViewController, AuthViewControllerProtocol {

        private let presenter: AuthPresenterProtcol

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .purple
            let button = UIButton()
            button.setTitle("go to code", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(showCode), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)

            NSLayoutConstraint.activate([
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                button.widthAnchor.constraint(equalToConstant: 200),
                button.heightAnchor.constraint(equalToConstant: 40)
            ])
        }

        @objc func showCode() {
            presenter.showCode()
        }

        init(presenter: AuthPresenterProtcol) {
            self.presenter = presenter
            super.init(nibName: nil, bundle: nil)
        }

        deinit {
            print("sdfdsf")
        }

        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
