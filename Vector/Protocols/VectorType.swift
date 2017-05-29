//
//  Vectorable.swift
//  Pods
//
//  Created by Mykola Kibysh on 5/26/17.
//
//

import Foundation

public protocol VectorType: ExpressibleByArrayLiteral {
    associatedtype Element
    
    init(elements: [Element])
    
    subscript (index: Int) -> Element { get set }
    
    var dimension: Int { get }
}

extension VectorType where Self: Equatable, Element: Equatable {
    
    func isEqual(to other: Self) -> Bool {
        if other.dimension == self.dimension {
            return self == other
        }
        return false
    }
 
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        guard lhs.dimension == rhs.dimension else {
            return false
        }
        
        for index in 0..<lhs.dimension {
            if lhs[index] != rhs[index] {
                return false 
            }
        }
        
        return true
    }
}

extension VectorType where Element: NumericArithmeticType {
    fileprivate mutating func add(other: Self, sign: AdditionSign) {
        for index in 0..<other.dimension {
            switch sign {
            case .plus:
                self[index] += other[index]
            case .minus:
                self[index] -= other[index]
            }
        }
    }
    
    fileprivate static func add(lhs: Self, rhs: Self, sign: AdditionSign) -> Self {
        var vector = lhs
        vector.add(other: rhs, sign: sign)
        return vector
    }
    
    fileprivate static func multiply(lhs: Self, rhs: Self) -> Element  {
        var result: Element = 0
        for index in 0..<lhs.dimension {
            result += lhs[index] * rhs[index]
        }
        
        return result
    }
    
    fileprivate static func multiply(lhs: Self, rhs: Self) -> Self {
        return lhs
    }
    
    //MARK: Pubsic methods
    
    static func +(lhs: Self, rhs: Self) -> Self {
        assert(lhs.dimension == rhs.dimension, "Cannot add vectors of different dimensions")
        return add(lhs: lhs, rhs: rhs, sign: .plus)
    }
    
    static func -(lhs: Self, rhs: Self) -> Self {
        assert(lhs.dimension == rhs.dimension, "Cannot subract vectors of different dimensions")
        return add(lhs: lhs, rhs: rhs, sign: .minus)
    }
    
    static func +=( lhs: inout Self, rhs: Self) {
        assert(lhs.dimension == rhs.dimension, "Cannot add vectors of different dimensions")
        lhs.add(other: rhs, sign: .plus)
    }
    
    static func -=( lhs: inout Self, rhs: Self) {
        assert(lhs.dimension == rhs.dimension, "Cannot subract vectors of different dimensions")
        lhs.add(other: rhs, sign: .minus)
    }
    
    static func *(lhs: Self, rhs: Self) -> Element {
        assert(lhs.dimension == rhs.dimension, "Cannot multiply vectors of different dimensions")
        return multiply(lhs: lhs, rhs: rhs)
    }
    
    static func *(lhs: Self, rhs: Self) -> Self {
        assert(lhs.dimension == rhs.dimension, "Cannot multiply vectors of different dimensions")
        return multiply(lhs: lhs, rhs: rhs)
    }
    
    /*
     public func ** <T: NumericArithmeticType> (lhs: Vector<T>, rhs: Vector<T>) -> Vector<T> {
     assert(lhs.dimension == rhs.dimension, "Cannot multiply vectors of different dimensions")
     return Vector<T>.multiply(left: lhs, right: rhs)
     }
 */
}

