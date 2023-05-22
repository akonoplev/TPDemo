//
//  AnyInitializable.swift
//  Technopark
//
//  Created by Semyon Baryshev on 20.09.2021.
//  Copyright © 2021 Technopark. All rights reserved.
//

import Foundation

public protocol AnyInitializable {
    init?(anyData data: Any)
}
