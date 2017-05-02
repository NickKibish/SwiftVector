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
    fileprivate mutating func add(vector: Vector, sign: AdditionSign) throws {
        if self.dimension != vector.dimension {
            throw VectorError.differentDimensions
        }
        
        for (index, element) in self.elements.enumerated() {
            let val = sign == .plus ? element : -element
            self[index] += val
        }
    }
    
    fileprivate static func add(lhs: Vector, rhs: Vector, sign: AdditionSign) throws -> Vector {
        var vector = lhs
        try vector.add(vector: rhs, sign: sign)
        return vector
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

infix operator +=: AdditionPrecedence
public func += <T: Numeric> (lhs: inout Vector<T>, rhs: Vector<T>) throws  {
    try lhs.add(vector: rhs, sign: .plus)
}

infix operator -=: AdditionPrecedence
public func -= <T: Numeric> (lhs: inout Vector<T>, rhs: Vector<T>) throws  {
    try lhs.add(vector: rhs, sign: .minus)
}
