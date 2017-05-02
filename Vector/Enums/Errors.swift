//
//  Errors.swift
//  Pods
//
//  Created by Nick Kibish on 5/2/17.
//
//

import Foundation

enum VectorError: Error, CustomStringConvertible {
    case differentDimensions
    
    var description: String {
        switch self {
        case .differentDimensions:
            return "Dimension of provided vectors are different"
        }
    }
    
}
