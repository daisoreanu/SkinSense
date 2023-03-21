//
//  UserProfile.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 16.03.2023.
//

import Foundation

struct UserProfile: Codable {
    var uuid: String?
    var email: String?
    var dateOfBirth: Date?
    var gender: Gender?
    var skinType: SkinType?
    var height: Height?
    var weight: Weight?
}
