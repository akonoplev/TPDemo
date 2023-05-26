//
//  AuthViewController.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import Foundation
import UIKit

protocol MainViewControllerProtocol: UIViewController {

}

extension MainPage {
    final class ViewController: UIViewController, MainViewControllerProtocol {

        private let presenter: MainPresenterProtcol

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            let button = UIButton()
            button.setTitle("Show auth", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(showAuth), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)

            NSLayoutConstraint.activate([
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                button.widthAnchor.constraint(equalToConstant: 200),
                button.heightAnchor.constraint(equalToConstant: 40)
            ])
        }

        @objc func showAuth() {
            presenter.showAuth()
        }

        init(presenter: MainPresenterProtcol) {
            self.presenter = presenter
            super.init(nibName: nil, bundle: nil)
        }

        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

