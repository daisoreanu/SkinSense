//
//  TextValidationModel.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 12.03.2023.
//

import Foundation
import UIKit
import Combine
import SwiftUI

typealias ValidationRules = [ValidationRule]

public struct TextValidationModel {
    var text: CurrentValueSubject<String, Never>
    var placeholder: String
    var validationLogic: ValidationRules
    var keyboardType: UIKeyboardType
    var isSecureTextEntry: Bool
    var isTitleNeeded: Bool
    var isAlertNeeded: Bool
    
    init(text: String = "",
         placeholder: String = "",
         validationLogic: ValidationRules = [],
         keyboardType: UIKeyboardType = .asciiCapable,
         isSecureTextEntry: Bool = false,
         isTitleNeeded: Bool = true,
         isAlertNeeded: Bool = true) {
        self.text = CurrentValueSubject<String, Never>(text)
        self.placeholder = placeholder
        self.validationLogic = validationLogic
        self.keyboardType = keyboardType
        self.isSecureTextEntry = isSecureTextEntry
        self.isTitleNeeded = isTitleNeeded
        self.isAlertNeeded = isAlertNeeded
    }
}

