//
//  CoordinatorAdapter.swift
//  TPDemo
//
//  Created by Александр Чернов on 23.05.2023.
//

import BaseArch

final class CoordinatorAdapter<Input, Output>: Coordinator {

    private let base: CoordinatorProtocol

    init(base: CoordinatorProtocol) {
        self.base = base
    }

    func start(input: Input, onComplete: ((Output) -> Void)?) {
        if var withAction = base as? ActionHandlingCoordinatorProtocol {
            withAction.actionClosure = { action in
                if let action = action as? Output {
                    onComplete?(action)
                } else {
                    fatalError("Неверный тип action. Ожидается \(Output.self) получили \(type(of: action))")
                }
            }
        }
        base.start()
    }
}
