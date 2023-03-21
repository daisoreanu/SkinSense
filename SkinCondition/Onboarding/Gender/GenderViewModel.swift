//
//  File.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 01.03.2023.
//

import Foundation
import UIKit

class GenderViewModel: ObservableObject {
    @Published var isSelected: Bool
    var title: String
    var image: UIImage {
        return UIImage(named: gender.imageName)!
    }
    var gender: Gender {
        return _gender
    }
    private let _gender: Gender
    
    init(isSelected: Bool = false, gender: Gender) {
        self._gender = gender
        self.isSelected = isSelected
        self.title = gender.title
    }
}

extension GenderViewModel: Identifiable {
    var id: Int {
        return self.hashValue
    }
}

extension GenderViewModel: Hashable {
    static func == (lhs: GenderViewModel, rhs: GenderViewModel) -> Bool {
        return lhs._gender.rawValue == rhs._gender.rawValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(_gender.rawValue)
    }
}
