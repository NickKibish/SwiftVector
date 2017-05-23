//
//  Errors.swift
//  Pods
//
//  Created by Nick Kibish on 5/2/17.
//
//

import Foundation

enum VectorError: Error, CustomStringConvertible {
    case unexpectedError
    
    var description: String {
        switch self {
        case .unexpectedError:
            return "Unexpected error was occured"
        }
    }
    
}
