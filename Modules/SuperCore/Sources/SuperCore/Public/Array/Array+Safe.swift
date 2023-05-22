//
//  Array+Safe.swift
//  Technopark
//
//  Created by Ivan Arkunov on 23.07.2021.
//  Copyright © 2021 Technopark. All rights reserved.
//

import Foundation

public extension Array {
    subscript(safeIndex index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }

        return self[index]
    }
}
