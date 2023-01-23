//
//  OptionalTypeKind.swift
//  DiagramForThesis
//
//  Created by オナガ・ハルキ on 2023/01/24.
//

import Foundation

enum OptionalTypeKind {
    case variable
    case functionParameter
    case functionReturnValue
    case initializerParameter
    
    init?(_ string: String) {
        switch string {
        case "variable":
            self = .variable
        case "functionParameter":
            self = .functionParameter
        case "functionReturnValue":
            self = .functionReturnValue
        case "initializerParameter":
            self = .initializerParameter
        default:
            return nil
        }
    }
}
