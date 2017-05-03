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

public struct Vector <T: Numeric> : ExpressibleByArrayLiteral {
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
        return lhs.elements == rhs.elements
    }
}

extension Vector {
    fileprivate static func throwDimension(left: Vector, right: Vector) throws {
        if left.dimension != right.dimension {
            throw VectorError.differentDimensions
        }
    }
    
    fileprivate mutating func add(vector: Vector, sign: AdditionSign) throws {
        try Vector.throwDimension(left: self, right: vector)
        
        for (index, element) in elements.enumerated() {
            let val = sign == .plus ? element : -element
            self[index] += val
        }
    }
    
    fileprivate static func add(lhs: Vector, rhs: Vector, sign: AdditionSign) throws -> Vector {
        var vector = lhs
        try vector.add(vector: rhs, sign: sign)
        return vector
    }
    
    fileprivate static func multiply(left: Vector, right: Vector) throws -> Element  {
        try throwDimension(left: left, right: right)
        
        var result: Element = 0
        for (index, element) in left.elements.enumerated() {
            result += right[index] * element
        }
        
        return result
    }
}

infix operator +: AdditionPrecedence
public func  + <T: Numeric> (lhs: Vector<T>, rhs: Vector<T>) throws -> Vector<T>  {
    return try Vector<T>.add(lhs: lhs, rhs: rhs, sign: .plus)
}

infix operator -: AdditionPrecedence
public func  - <T: Numeric> (lhs: Vector<T>, rhs: Vector<T>) throws -> Vector<T>  {
    return try Vector<T>.add(lhs: lhs, rhs: rhs, sign: .minus)
}

infix operator ++=: AdditionPrecedence
public func ++= <T: Numeric> (lhs: inout Vector<T>, rhs: Vector<T>) throws  {
    try lhs.add(vector: rhs, sign: .plus)
}

infix operator --=: AdditionPrecedence
public func --= <T: Numeric> (lhs: inout Vector<T>, rhs: Vector<T>) throws  {
    try lhs.add(vector: rhs, sign: .minus)
}

infix operator *: MultiplicationPrecedence
public func * <T: Numeric> (lhs: Vector<T>, rhs: Vector<T>) throws -> T {
    return try Vector<T>.multiply(left: lhs, right: rhs)
}

