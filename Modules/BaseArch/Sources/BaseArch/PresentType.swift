//
//  File.swift
//  
//
//  Created by Андрей Коноплев on 07.06.2023.
//

import Foundation

public enum PresentType<Context> {
    case fullScreen
    case bottomSheet(context: Context)
}
