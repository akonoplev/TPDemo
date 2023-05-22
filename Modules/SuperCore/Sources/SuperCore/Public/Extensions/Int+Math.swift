//
//  Int+Math.swift
//  
//
//  Created by Илья on 22.12.2022.
//

public extension Int {
    /// Ограничить значение с учетом минимального, максимальное значения и округляет до значения делимого на шаг без остатка
    /// Пример
    /// 1.closeInRange(min: 5, max: 100, step: 3) = 5
    /// 10.closeInRange(min: 5, max: 100, step: 3) = 9
    /// 100.closeInRange(min: 5, max: 100, step: 3) = 99
    func closeInRange(min: Int = Int.min, max: Int = Int.max, step: Int = 1) -> Int {
        var fixedValue = self
        if step > 1 {
            fixedValue /= step
            if self % step >= step / 2 {
                fixedValue += 1
            }
            fixedValue *= step
        }

        if fixedValue < min {
            return min
        } else if fixedValue > max {
            return max
        } else {
            return fixedValue
        }
    }
}
