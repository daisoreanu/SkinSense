//
//  SkinTypePickerViewModel.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 15.03.2023.
//

import Foundation

class SkinTypePickerViewModel {
    
    private let didRequestAction: (SkinTypePickerViewModelAction) -> Void
    
    init(didRequestAction: @escaping (SkinTypePickerViewModelAction) -> Void) {
        self.didRequestAction = didRequestAction
    }
    
    func userSelection(skinType: SkinType) {
        didRequestAction(.skinTypeConfirmed(skinType: skinType))
    }
    
}

enum SkinTypePickerViewModelAction {
    case skinTypeConfirmed(skinType: SkinType)
}
