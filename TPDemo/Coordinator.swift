//
//  Coordinator.swift
//  TPDemo
//
//  Created by Александр Чернов on 23.05.2023.
//

import UIKit

protocol Coordinator<Input, Output> {
    associatedtype Input
    associatedtype Output

    func start(input: Input,
               onComplete: ((Output) -> Void)?)
}
