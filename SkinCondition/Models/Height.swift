//
//  Height.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 16.03.2023.
//

import Foundation

enum Height: Codable {
    case metric(cm: Int)
    case imperial(ft: Int, inch: Int)
    
    var asString: String {
        switch self {
        case .metric(cm: let cm):
            return "\(cm)cm"
        case .imperial(ft: let ft, inch: let inch):
            return "\(ft)ft \(inch)in"
        }
    }
}
