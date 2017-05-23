//
//  Vector.swift
//  Pods
//
//  Created by Nick Kibish on 5/1/17.
//
//

import Foundation

enum AdditionSign {
    case plus, minus
}

public struct Vector <T: Equatable> : ExpressibleByArrayLiteral {
    public typealias Element = T
    fileprivate var elements: [Element]
    
    public init(dimension: Int, repeatValue: Element) {
        self.elements = Array<Element>(repeating: repeatValue, count: dimension)
    }
    
    public init(arrayLiteral elements: Vector.Element...) {
        self.elements = elements
    }
    
    public init(elements: [Element]) {
        self.elements = elements
    }
    
    public subscript (index: Int) -> Element {
        get {
            return elements[index]
        }
        set (newValue) {
            elements[index] = newValue 
        }
    }
    
    /// In mathematics, the dimension of a vector space V is the cardinality (i.e. the number of vectors) of a basis of V over its base field.
    public var dimension: Int {
        return elements.count
    }
}

extension Vector: Equatable {
    public static func ==(lhs: Vector, rhs: Vector) -> Bool {
        if lhs.dimension != rhs.dimension {
            return false
        }
        for (index, element) in lhs.elements.enumerated() {
            if element != rhs[index] {
                return false
            }
        }
        return true
    }
}

extension Vector where Element: NumericArithmeticType {
    public static func ==(lhs: Vector, rhs: Vector) -> Bool {
        return lhs.elements == rhs.elements
    }
}

extension Vector where Element: NumericArithmeticType {
    fileprivate mutating func add(vector: Vector, sign: AdditionSign) {
        for (index, element) in elements.enumerated() {
            switch sign {
            case .plus:
                self[index] += element
            case .minus:
                self[index] -= element
            }
        }
    }
    
    fileprivate static func add(lhs: Vector, rhs: Vector, sign: AdditionSign) -> Vector {
        var vector = lhs
        vector.add(vector: rhs, sign: sign)
        return vector
    }
    
    fileprivate static func multiply(left: Vector, right: Vector) -> Element  {
        var result: Element = 0
        for (index, element) in left.elements.enumerated() {
            result += right[index] * element
        }
        
        return result
    }
}

infix operator +: AdditionPrecedence
public func  + <T: NumericArithmeticType> (lhs: Vector<T>, rhs: Vector<T>) -> Vector<T>  {
    assert(lhs.dimension == rhs.dimension, "Cannot add vectors of different dimensions")
    return Vector<T>.add(lhs: lhs, rhs: rhs, sign: .plus)
}

infix operator -: AdditionPrecedence
public func  - <T: NumericArithmeticType> (lhs: Vector<T>, rhs: Vector<T>) -> Vector<T>  {
    assert(lhs.dimension == rhs.dimension, "Cannot subract vectors of different dimensions")
    return Vector<T>.add(lhs: lhs, rhs: rhs, sign: .minus)
}

//infix operator +=: AdditionPrecedence
public func += <T: NumericArithmeticType> (lhs: inout Vector<T>, rhs: Vector<T>)  {
    assert(lhs.dimension == rhs.dimension, "Cannot add vectors of different dimensions")
    lhs.add(vector: rhs, sign: .plus)
}

//infix operator -=: AdditionPrecedence
public func -= <T: NumericArithmeticType> (lhs: inout Vector<T>, rhs: Vector<T>)  {
    assert(lhs.dimension == rhs.dimension, "Cannot subract vectors of different dimensions")
    lhs.add(vector: rhs, sign: .minus)
}

infix operator *: MultiplicationPrecedence
public func * <T: NumericArithmeticType> (lhs: Vector<T>, rhs: Vector<T>) -> T {
    assert(lhs.dimension == rhs.dimension, "Cannot add vectors of different dimensions")
    return Vector<T>.multiply(left: lhs, right: rhs)
}

