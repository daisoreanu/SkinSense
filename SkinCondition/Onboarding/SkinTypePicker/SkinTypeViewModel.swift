//
//  SkinTypeViewModel.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 11.03.2023.
//

import Foundation
import UIKit
import SwiftUI

class SkinTypeViewModel: Identifiable, ObservableObject {
    
    private let _skinType: SkinType
    var skinType: SkinType { return _skinType }
    @Published var isSelected: Bool
    
    init(skinType: SkinType, isSelected: Bool = false) {
        self._skinType = skinType
        self.isSelected = isSelected
    }
    
    var id : UUID {
        return _skinType.id
    }
    var title : String {
        return _skinType.title
    }
    var description: String {
        return _skinType.description
    }
    var image: UIImage {
        return UIImage(named: _skinType.imageName)!
    }
}

extension SkinTypeViewModel: Hashable {
    static func == (lhs: SkinTypeViewModel, rhs: SkinTypeViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
