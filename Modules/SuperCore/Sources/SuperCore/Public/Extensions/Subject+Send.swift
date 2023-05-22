//
//  Subject+Send.swift
//  Technopark
//
//  Created by Илья on 08.12.2022.
//

import Combine

public extension Subject {
    func send(_ result: Result<Output, Failure>) {
        switch result {
        case let .success(result):
            send(result)
        case let .failure(error):
            send(completion: .failure(error))
        }
    }
}
