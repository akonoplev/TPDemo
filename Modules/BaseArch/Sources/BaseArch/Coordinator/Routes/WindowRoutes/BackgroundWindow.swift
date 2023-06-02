//
//  BackgroundWindow.swift
//  
//
//  Created by Daniil on 01.06.2023.
//

import UIKit

class BackgroundWindow: UIWindow, CAAnimationDelegate {
    func animationDidStop(_: CAAnimation, finished _: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.removeFromSuperview()
        }
    }
}
