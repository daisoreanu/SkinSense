//
//  Weight.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 16.03.2023.
//

import Foundation

enum Weight: Codable {
    case metric(kg: Int)
    case imperial(pounds: Int)
    
    var asString: String {
        switch self {
        case .metric(kg: let kg):
            return "\(kg)kg"
        case .imperial(pounds: let pound):
            return "\(pound)lb"
        }
    }
}
