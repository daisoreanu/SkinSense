//
//  AppConstants.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 12.03.2023.
//

import Foundation

struct AppConstants {
    struct Regex {
        static let email = "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        static let name = "^[a-zA-Z]+(?:[\\s'][a-zA-Z]+)*$"
        static let password = "^[a-zA-Z0-9]{8,32}$"
        static let feet = "^[3-9]{1}$" //3 --> 9
        static let inch = "^([0-9]|[1][0-1])$" // 0 --> 11
        static let cm = "^[1-2]{1}[0-9]{1}[0-9]{1}$" // 100 --> 299
        static let pound = "^([89][0-9]|[1-9][0-9][0-9])$" //80 --> 999
    }
}
