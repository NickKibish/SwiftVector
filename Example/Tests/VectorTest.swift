//
//  VectorTest.swift
//  Vector
//
//  Created by Nick Kibish on 5/1/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import Vector

class VectorTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRepeatValue() {
        let vec = Vector<Int>(dimension: 3, repeatValue: 1)
        XCTAssertEqual(vec[0], 1)
        XCTAssertEqual(vec[1], 1)
        XCTAssertEqual(vec[2], 1)
    }
    
    func testArrayValueInit() {
        let vecArray = [1, 2, 3]
        let vec = Vector(elements: vecArray)
        XCTAssertEqual(vec[0], 1)
        XCTAssertEqual(vec[1], 2)
        XCTAssertEqual(vec[2], 3)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
