//
//  TechnoThrottler.swift
//  Technopark
//
//  Created by Денис Демидов on 28.12.2020.
//  Copyright © 2020 Technopark. All rights reserved.
//

import Foundation

public final class TechnoThrottler {
    public var interval: TimeInterval

    public init(interval: TimeInterval = 0.25) {
        self.interval = interval
    }

    private let queue = DispatchQueue.global(qos: .background)
    private var job: DispatchWorkItem? {
        didSet {
            oldValue?.cancel()
        }
    }

    public func throttle(_ block: @escaping () -> Void) {
        let job = DispatchWorkItem {
            DispatchQueue.main.async {
                block()
            }
        }
        self.job = job
        queue.asyncAfter(deadline: .now() + interval, execute: job)
    }

    public func cancel() {
        job = nil
    }
}
