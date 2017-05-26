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
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
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
    
}
