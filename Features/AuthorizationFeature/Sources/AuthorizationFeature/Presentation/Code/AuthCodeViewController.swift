//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import Foundation
import UIKit

protocol AuthCodeViewControllerProtocol: UIViewController {

}

final class AuthCodeViewController: UIViewController, AuthCodeViewControllerProtocol {

    private let presenter: AuthCodePresenterProtcol

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
    }

    init(presenter: AuthCodePresenterProtcol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
