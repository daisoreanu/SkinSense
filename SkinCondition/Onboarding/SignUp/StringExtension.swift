//
//  StringExtension.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 12.03.2023.
//

import Foundation

public extension String {
    func isValid(_ validationRule: ValidationRule) -> ValidationState {
        let predicate = NSPredicate(format:"SELF MATCHES %@", validationRule.regex)
        let isValid = predicate.evaluate(with: self)
        if isValid == false {
            return .invalid(validationRule.message)
        }
        return .valid
    }
}
