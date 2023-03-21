//
//  Gender.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 16.03.2023.
//

import Foundation

enum Gender: String, Codable {
    case male = "6C47732A-BD39-4942-8A59-43E046661090"
    case female = "6C47732A-BD39-4942-8A59-43E046661091"
    case nonbinary = "6C47732A-BD39-4942-8A59-43E046661092"
    
    var imageName: String {
        switch self {
        case .male:
            return "male"
        case .female:
            return "female"
        case .nonbinary:
            return "nonbinary"
        }
    }
    
    var title: String {
        switch self {
        case .male:
            return "Male"
        case .female:
            return "Female"
        case .nonbinary:
            return "Nonbinary"
        }
    }
}

let genderData = [GenderViewModel(gender: Gender.male),
                  GenderViewModel(gender: Gender.female),
                  GenderViewModel(gender: Gender.nonbinary)]
