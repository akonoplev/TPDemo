//
//  UIView+Animation.swift
//  
//
//  Created by Daniil on 01.06.2023.
//

import UIKit

public extension UIView {
    enum AnimationDuration: TimeInterval {
        case quick = 0.1
        case `default` = 0.15
        case normal = 0.3
        case slow = 0.5
    }

    enum AnimationDelay: TimeInterval {
        case `default` = 0.25
    }

    func animate(duration: AnimationDuration, animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration.rawValue, animations: animations, completion: completion)
    }

    func fadeTransition(duration: AnimationDuration) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.type = .fade
        animation.duration = duration.rawValue
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }

    func pushTransition(duration: AnimationDuration, direction: CATransitionSubtype) {
        let animation = CATransition()
        animation.duration = duration.rawValue
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.type = .push
        animation.subtype = direction
        layer.add(animation, forKey: CATransitionType.push.rawValue)
    }

    func animateProperty(duration: AnimationDuration, curve: AnimationCurve, animations: @escaping () -> Void) {
        UIViewPropertyAnimator(duration: duration.rawValue, curve: curve, animations: animations).startAnimation()
    }
}
