//
//  BuilderProtocol.swift
//  
//
//  Created by Daniil on 31.05.2023.
//

import SwiftUI
import UIKit

public protocol BuilderProtocol: AnyObject {
    func build() -> UIViewController
}
