//
//  UserValidation.swift
//  UserFirebase
//
//  Created by alexey sorochan on 19.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation

class Validation {
    
    public func validateString(_ string: String) -> Bool {
        let nameRegex = "^\\w{3,18}$"
        let trimmedString = string.trimmingCharacters(in: .whitespaces)
        let validateString = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        let isvalidateString = validateString.evaluate(with: trimmedString)
        return isvalidateString
    }

    
    public func validateAge(_ age: Int) -> Bool {
        if age >= 18 && age <= 99 {
            return true
        } else {
            return false
        }
    }
}
