//
//  Publisher+Sink.swift
//  Technopark
//
//  Created by Semyon Baryshev on 27.10.2021.
//  Copyright © 2021 Technopark. All rights reserved.
//

import Combine
import Foundation

public extension Publisher {
    func sink(
        receiveFinished: (() -> Void)? = nil,
        receiveFailure: ((Failure) -> Void)? = nil,
        receiveValue: ((Output) -> Void)? = nil
    ) -> AnyCancellable {
        sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    receiveFinished?()
                case let .failure(error):
                    receiveFailure?(error)
                }
            },
            receiveValue: { value in
                receiveValue?(value)
            }
        )
    }
}
