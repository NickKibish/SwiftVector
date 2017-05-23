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
    
    func testExpressibleByArrayLiteral() {
        let vec: Vector<Int> = [1, 2, 3]
        XCTAssertEqual(vec[0], 1)
        XCTAssertEqual(vec[1], 2)
        XCTAssertEqual(vec[2], 3)
    }
    
    func testEquatable() {
        let vec1: Vector<Int> = [1, 2, 3]
        let vec2: Vector<Int> = [1, 2, 3]
        
        XCTAssertEqual(vec1, vec2)
        
        let vec3: Vector<Int> = [1, 2, 3]
        let vec4: Vector<Int> = [1, 2, 3, 4]
        
        XCTAssertNotEqual(vec3, vec4)
        
        
        let vec6: Vector<Int> = [1, 2, 3, 5]
        let vec7: Vector<Int> = [1, 2, 3, 4]
        
        XCTAssertNotEqual(vec6, vec7)
    }
    
    //MARK: - Test operators
    func testAppending() {
        let vec1: Vector = [1, 2, 3]
        let vec2: Vector = [1, 2, 3]
        let vec3: Vector = [2, 4, 6]
        
        XCTAssertEqual(vec1 + vec2, vec3)
    }
    
    func testSubtraction() {
        let vec1: Vector = [1, 2, 3]
        let vec2: Vector = [1, 2, 3]
        let vec3: Vector = [0, 0, 0]
        
        XCTAssertEqual(vec1 - vec2, vec3)
    }
    
    func testUnarAppending() {
        var vec1: Vector = [1, 2, 3]
        let vec2: Vector = [1, 2, 3]
        let vec3: Vector = [2, 4, 6]
        vec1 += vec2
        XCTAssertEqual(vec1, vec3)
    }
    
    func testUnarSubtraction() {
        var vec1: Vector = [1, 2, 3]
        let vec2: Vector = [1, 2, 3]
        let vec3: Vector = [0, 0, 0]
        
        vec1 -= vec2
        XCTAssertEqual(vec1, vec3)
    }
    
    func testScalarDot() {
        let vec1: Vector = [1, 2, 3]
        let vec2: Vector = [1, 2, 3]
        
        let scalarDot = vec1 * vec2
        XCTAssertEqual(scalarDot, 14)
    }
}
