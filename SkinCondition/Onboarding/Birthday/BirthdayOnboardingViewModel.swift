//
//  BirthdayOnboardingViewModel.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 03.03.2023.
//

import Foundation

class BirthdayOnboardingViewModel: ObservableObject {
    let minDate = Date().changeYear(by: -14)!
    let maxDate = Date().changeYear(by: -90)!
    @Published var selectedDate = Date().changeYear(by: -16)!
    
    private let didRequestAction: (BirthdayOnboardingViewModelAction) -> Void
    
    init(didRequestAction: @escaping (BirthdayOnboardingViewModelAction) -> Void) {
        self.didRequestAction = didRequestAction
    }
    
    func userTappedConfirmBirthday(){
        didRequestAction(.birthdayConfirmed(date: selectedDate))
    }
}

enum BirthdayOnboardingViewModelAction {
    case birthdayConfirmed(date: Date)
}


