//
//  AuthViewController.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import BaseArch
import Foundation
import UIKit

protocol MainViewControllerProtocol: UIViewController {}

final class MainViewController: BaseViewController, MainViewControllerProtocol {

    private let presenter: MainPresenterProtcol

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("К авторизации", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        button.addTarget(self, action: #selector(showAuth), for: .touchUpInside)

        let pushButton = UIButton()
        pushButton.backgroundColor = .gray
        pushButton.setTitle("К авторизации по телефону", for: .normal)
        pushButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(pushButton)

        NSLayoutConstraint.activate([
            pushButton.widthAnchor.constraint(equalToConstant: 200),
            pushButton.heightAnchor.constraint(equalToConstant: 30),
            pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20)
        ])

        pushButton.addTarget(self, action: #selector(pushAuth), for: .touchUpInside)

        let cardButton = UIButton()
        cardButton.backgroundColor = .gray
        cardButton.setTitle("К карточке", for: .normal)
        cardButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(cardButton)

        NSLayoutConstraint.activate([
            cardButton.widthAnchor.constraint(equalToConstant: 200),
            cardButton.heightAnchor.constraint(equalToConstant: 30),
            cardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardButton.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 20)
        ])

        cardButton.addTarget(self, action: #selector(showCard), for: .touchUpInside)
    }

    @objc func showAuth() {
        presenter.showAuth()
    }

    @objc func pushAuth() {
        presenter.pushAuth()
    }

    @objc func showCard() {
        presenter.showCard()
    }

    init(presenter: MainPresenterProtcol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = .yellow
        title = "Главная"
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
