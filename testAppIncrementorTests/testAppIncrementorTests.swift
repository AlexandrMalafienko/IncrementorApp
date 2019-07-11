//
//  testAppIncrementorTests.swift
//  testAppIncrementorTests
//
//  Created by Alexandr Malafienko on 09/07/2019.
//  Copyright © 2019 Alexandr Malafienko. All rights reserved.
//

import XCTest
import Foundation

class testAppIncrementorTests: XCTestCase {
    
    func testGetNumber() {
        let incrementor = Incrementor()
        let number = incrementor.getNumber()
        XCTAssert(number == 0)
    }
    
    func testSetMaxValue() {
        let incrementor = Incrementor()
        incrementor.setMax(50)
        XCTAssert(incrementor.maxValue == 50)
        incrementor.setMax(-1)
        XCTAssert(incrementor.maxValue == 50)
    }

    func testIncrementNumber() {
        let incrementor = Incrementor()
        incrementor.incrementNumber()
        incrementor.incrementNumber()
        incrementor.incrementNumber()
        incrementor.incrementNumber()
        XCTAssert(incrementor.value == 4)
        incrementor.setMax(2)
        XCTAssert(incrementor.value == 0)
        incrementor.incrementNumber()
        incrementor.incrementNumber()
        XCTAssert(incrementor.value == 0)
    }

}
