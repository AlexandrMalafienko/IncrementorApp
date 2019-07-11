//
//  Incrementor.swift
//  testAppIncrementor
//
//  Created by Alexandr Malafienko on 04/07/2019.
//  Copyright © 2019 Alexandr Malafienko. All rights reserved.
//

import Foundation

class Incrementor {
    
    var maxValue: Int = .max
    
    var value: Int = 0
    
    /// Get number, default value = 0.
    
    func getNumber() -> Int {
        return value
    }
    
    /// Set maxumum value, default = Int max value. Does not allow to set the maximum value to 0.
    
    func setMax(_ newMaxValue: Int) {
        maxValue = newMaxValue
        if value >= maxValue {
            value = 0
        }
    }
    
    /// Increases the current number by 1. If the maximum value Int is exceeded, the value will be 0.
    
    func incrementNumber() {
        var newValue = value + 1
        
        if newValue == maxValue || maxValue < 0 {
            newValue = 0
        }
        
        value = max(0, newValue)
    }
    
}
