//
//  SkinType.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 07.03.2023.
//

import Foundation

enum SkinType: String, Identifiable, Codable {
    
    case dry = "FBFC491C-3334-4A90-A70B-2EC1F83E5F30"
    case oily = "FBFC491C-3334-4A90-A70B-2EC1F83E5F31"
    case mixed = "FBFC491C-3334-4A90-A70B-2EC1F83E5F32"
    case sensitive = "FBFC491C-3334-4A90-A70B-2EC1F83E5F33"
    case normal = "FBFC491C-3334-4A90-A70B-2EC1F83E5F34"
    case pigmented = "FBFC491C-3334-4A90-A70B-2EC1F83E5F35"
    
    var description: String {
        switch self {
        case .dry:
            return "Flaky, scaly or rough patches on the face and/or body"
        case .oily:
            return "Shiny, greasy looking, most likely to have visible enlarged pores"
        case .mixed:
            return "Drier in some places (mostly cheeks) and oily in others such as T-zone"
        case .sensitive:
            return "May burn or itch after using certain cosmetics and skincare products"
        case .normal:
            return "Balances, clear and not sensitive"
        case .pigmented:
            return "Darker patches on face and/or body due to excess production of melanin"
        }
    }
    
    var imageName: String {
        switch self {
        case .dry:
            return "drySkin"
        case .oily:
            return "oilySkin"
        case .mixed:
            return "mixedSkin"
        case .sensitive:
            return "sensitiveSkin"
        case .normal:
            return "normalSkin"
        case .pigmented:
            return "pigmentedSkin"
        }
    }
    
    var title: String {
        switch self {
        case .dry:
            return "DRY"
        case .oily:
            return "OILY"
        case .mixed:
            return "COMBINATION"
        case .sensitive:
            return "SENSITIVE"
        case .normal:
            return "NORMAL"
        case .pigmented:
            return "PIGMENTED"
        }
    }
    
    var id: UUID {
        return UUID(uuidString: self.rawValue)!
    }
    
}

extension SkinType: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

var skinTypesData = [SkinTypeViewModel(skinType: SkinType.dry),
                     SkinTypeViewModel(skinType: SkinType.oily),
                     SkinTypeViewModel(skinType: SkinType.mixed),
                     SkinTypeViewModel(skinType: SkinType.sensitive),
                     SkinTypeViewModel(skinType: SkinType.normal),
                     SkinTypeViewModel(skinType: SkinType.pigmented)]
