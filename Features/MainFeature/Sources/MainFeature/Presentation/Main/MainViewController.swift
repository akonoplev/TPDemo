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

final class MainViewController: UIViewController, MainViewControllerProtocol {

    private let presenter: MainPresenterProtcol

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton()
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 60),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        button.addTarget(self, action: #selector(showAuth), for: .touchUpInside)
    }

    @objc func showAuth() {
        presenter.showAuth()
    }

    init(presenter: MainPresenterProtcol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = .red
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
