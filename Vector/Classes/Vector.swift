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

public struct Vector <T: Equatable> : VectorType, Equatable {
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
