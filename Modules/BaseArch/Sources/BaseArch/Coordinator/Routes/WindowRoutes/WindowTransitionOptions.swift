//
//  WindowTransitionOptions.swift
//  
//
//  Created by Daniil on 01.06.2023.
//

import UIKit

public struct WindowTransitionOptions {
    // MARK: Lifecycle

    init(direction: WindowTransitionOptions.Direction = .toRight, style: WindowTransitionOptions.Curve = .easeInOut) {
        self.direction = direction
        self.style = style
    }

    // MARK: Public

    public enum Direction {
        case fade
        case toTop
        case toBottom
        case toLeft
        case toRight

        // MARK: Internal

        var transition: CATransition {
            let transition = CATransition()
            transition.type = .push
            switch self {
            case .fade:
                transition.type = .fade
                transition.subtype = nil
            case .toLeft:
                transition.subtype = .fromLeft
            case .toRight:
                transition.subtype = .fromRight
            case .toTop:
                transition.subtype = .fromTop
            case .toBottom:
                transition.subtype = .fromBottom
            }
            return transition
        }
    }

    // MARK: Internal

    enum Curve {
        case linear
        case easeIn
        case easeOut
        case easeInOut

        // MARK: Internal

        var function: CAMediaTimingFunction {
            CAMediaTimingFunction(name: mediaTimingFunctionName)
        }

        // MARK: Private

        private var mediaTimingFunctionName: CAMediaTimingFunctionName {
            switch self {
            case .linear:
                return .linear
            case .easeIn:
                return .easeIn
            case .easeOut:
                return .easeOut
            case .easeInOut:
                return .easeInEaseOut
            }
        }
    }

    var duration: TimeInterval = 0.3
    var direction: WindowTransitionOptions.Direction = .toRight
    var style: WindowTransitionOptions.Curve = .easeInOut
    var backgroundColor: UIColor?

    var animation: CATransition {
        let transition = direction.transition
        transition.duration = duration
        transition.timingFunction = style.function
        return transition
    }
}
