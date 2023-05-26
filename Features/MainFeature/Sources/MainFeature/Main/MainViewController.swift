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
        button.addTarget(self, action: #selector(showAuth), for: .touchUpInside)
        view.addSubview(button)
        button.backgroundColor = .white
        button.frame = .init(x: 100, y: 100, width: 100, height: 100)

        let tabBarButton = UIButton()
        tabBarButton.addTarget(self, action: #selector(tabBar), for: .touchUpInside)
        view.addSubview(tabBarButton)
        tabBarButton.backgroundColor = .white
        tabBarButton.frame = .init(x: 100, y: 300, width: 100, height: 100)
    }

    @objc func showAuth() {
        presenter.showAuth()
    }

    @objc func tabBar() {
        presenter.showTabBar()
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
