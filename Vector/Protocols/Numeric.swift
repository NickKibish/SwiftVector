//
//  Numeric.swift
//  Pods
//
//  Created by Nick Kibish on 5/1/17.
//
//

import Foundation

public protocol Numeric: Equatable, Comparable, CustomStringConvertible, ExpressibleByIntegerLiteral {
    
    static func +(lhs: Self, rhs: Self) -> Self
    
    static func -(lhs: Self, rhs: Self) -> Self
    
    static func *(lhs: Self, rhs: Self) -> Self
    
    static func /(lhs: Self, rhs: Self) -> Self
    
    static func +=(lhs: inout Self, rhs: Self)
    
    static func -=(lhs: inout Self, rhs: Self)
    
    static func *=(lhs: inout Self, rhs: Self)
    
    static func /=(lhs: inout Self, rhs: Self)
    
    prefix static func -(rhs: Self) -> Self
    
    prefix static func +(rhs: Self) -> Self
}



extension Int: Numeric { }
extension Int8: Numeric { }
extension Int16: Numeric { }
extension Int32: Numeric { }
extension Int64: Numeric { }

extension Float: Numeric { }
extension Float80: Numeric { }

extension Double: Numeric { }
