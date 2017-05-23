//
//  Numeric.swift
//  Pods
//
//  Created by Nick Kibish on 5/1/17.
//
//

import Foundation

public protocol NumericArithmeticType: ExpressibleByIntegerLiteral, Equatable {
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Self) -> Self
    static func /(lhs: Self, rhs: Self) -> Self
    
    static func +=( lhs: inout Self, rhs: Self)
    static func -=( lhs: inout Self, rhs: Self)
    static func *=( lhs: inout Self, rhs: Self)
    static func /=( lhs: inout Self, rhs: Self)
}

extension Int8   : SignedNumericArithmeticType { }
extension Int16  : SignedNumericArithmeticType { }
extension Int32  : SignedNumericArithmeticType { }
extension Int64  : SignedNumericArithmeticType { }
extension Int    : SignedNumericArithmeticType { }
extension UInt8  : NumericArithmeticType { }
extension UInt16 : NumericArithmeticType { }
extension UInt32 : NumericArithmeticType { }
extension UInt64 : NumericArithmeticType { }
extension UInt   : NumericArithmeticType { }

protocol FloatingPointArithmeticType : SignedNumericArithmeticType, ExpressibleByFloatLiteral { }

protocol SignedNumericArithmeticType: NumericArithmeticType {
    prefix static func -(value: Self) -> Self
}

extension Float32 : FloatingPointArithmeticType { }
extension Float64 : FloatingPointArithmeticType { }
extension Float80 : FloatingPointArithmeticType { }
