//
//  RequiredRule.swift
//
//
//  Created by Erick Martin on 9/18/16.
//
//

import Foundation
import SwiftValidator

extension RequiredRule {
    
    class func create(_ fieldName: String) -> RequiredRule {
        return RequiredRule(message: String(format: "%@ must be filled", fieldName))
    }
}

