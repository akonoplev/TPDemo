//
//  Publishers+DebounceExceptFirst.swift
//  Technopark
//
//  Created by Даниил on 09.03.2022.
//  Copyright © 2022 Technopark. All rights reserved.
//

import Combine
import Foundation

// ref: https://stackoverflow.com/questions/60295544/how-do-you-apply-a-combine-operator-only-after-the-first-message-has-been-receiv
enum DebounceEvent<Value> {
    case value(Value)
    case timerFired
}

struct DebounceState<Value, S: Scheduler> {
    let scheduler: S
    let interval: S.SchedulerTimeType.Stride
    let options: S.SchedulerOptions?

    let subject = PassthroughSubject<Void, Never>()

    enum TimerState {
        case notRunning
        case running(PendingOutput?)

        struct PendingOutput {
            var value: Value
            var earliestDeliveryTime: S.SchedulerTimeType
        }
    }

    var output: Value?
    var timerState: TimerState = .notRunning
}

public extension Publisher {
    func debounceExceptFirst<S: Scheduler>(
        for dueTime: S.SchedulerTimeType.Stride,
        scheduler: S,
        options: S.SchedulerOptions? = nil
    ) -> AnyPublisher<Output, Failure> {
        let initialState = DebounceState<Output, S>(
            scheduler: scheduler,
            interval: dueTime,
            options: options)
        let timerEvents = initialState.subject
            .map { _ in DebounceEvent<Output>.timerFired }
            .setFailureType(to: Failure.self)
        return self
            .map { DebounceEvent.value($0) }
            .merge(with: timerEvents)
            .scan(initialState) { $0.updated(with: $1) }
            .compactMap { $0.output }
            .eraseToAnyPublisher()
    }
}

extension DebounceState {
    func updated(with event: DebounceEvent<Value>) -> DebounceState<Value, S> {
        var answer = self
        switch (event, timerState) {
        case (.value(let value), .notRunning):
            answer.output = value
            answer.timerState = .running(nil)
            scheduler.schedule(
                after: scheduler.now.advanced(by: interval),
                tolerance: .zero,
                options: options
            ) { [subject] in subject.send() }
        case (.value(let value), .running):
            answer.output = nil
            answer.timerState = .running(.init(value: value, earliestDeliveryTime: scheduler.now.advanced(by: interval)))
        case (.timerFired, .running(nil)):
            answer.output = nil
            answer.timerState = .notRunning
        case (.timerFired, .running(.some(let pendingOutput))):
            let now = scheduler.now
            // Измененная логика относительно того, что на stackoverflow. События, происходившие между интервалами, отправлятся не будут
            answer.output = pendingOutput.earliestDeliveryTime <= now ? pendingOutput.value : nil
            answer.timerState = .notRunning
        case (.timerFired, .notRunning):
            // Impossible!
            answer.output = nil
        }
        return answer
    }
}
