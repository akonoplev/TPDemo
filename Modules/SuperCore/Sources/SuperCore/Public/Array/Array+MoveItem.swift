//
//  Array+MoveItem.swift
//
//
//  Created by Vladislav Bystritskiy on 09/07/22.
//

import Foundation

public extension Array {
    mutating func moveItem(from oldIndex: Index, to newIndex: Index) {
        if oldIndex == newIndex {
            return
        } else if newIndex > (self.count - 1) {
            let currentIndex = self.count - 1
            insert(remove(at: oldIndex), at: currentIndex)
        } else if newIndex == 0 {
            insert(remove(at: oldIndex), at: 0)
        } else if abs(newIndex - oldIndex) == 1 {
            return swapAt(oldIndex, newIndex)
        } else {
            insert(remove(at: oldIndex), at: newIndex)
        }
    }
}
