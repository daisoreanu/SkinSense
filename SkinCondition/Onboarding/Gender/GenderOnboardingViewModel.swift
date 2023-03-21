//
//  GenderOnboardingViewModel.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 01.03.2023.
//

import Foundation

class GenderOnboardingViewModel: ObservableObject {
    
    private var currentSelection: GenderViewModel?
    @Published var state: ButtonState = .dissabled
    
    private let didRequestAction: (GenderOnboardingViewModelAction) -> Void
    
    init(didRequestAction: @escaping (GenderOnboardingViewModelAction) -> Void) {
        self.didRequestAction = didRequestAction
    }
    
    func userTappedGetStarted() {
        if let gender = currentSelection?.gender {
            didRequestAction(.genderConfirmed(gender: gender))
        }
    }
    
    func select(_ item: GenderViewModel) {
        if item != currentSelection {
            state = .enabled
            currentSelection?.isSelected = false
            currentSelection = item
            currentSelection?.isSelected = true
        }
    }
    
    func resetData() {
        state = .dissabled
        currentSelection?.isSelected = false
        currentSelection = nil
    }
    
}

enum GenderOnboardingViewModelAction {
    case genderConfirmed(gender: Gender)
}
