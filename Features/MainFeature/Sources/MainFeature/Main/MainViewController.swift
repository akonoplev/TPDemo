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
    }

    init(presenter: MainPresenterProtcol) {
        self.presenter = presenter
        super.init()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
