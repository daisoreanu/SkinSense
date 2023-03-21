//
//  WeightViewModel.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 17.03.2023.
//

import Foundation

class WeightViewModel: ObservableObject {
    @Published var state: ButtonState = .dissabled
    @Published var metricState: ButtonState = .dissabled
    @Published var imperialState: ButtonState = .enabled
    
    private let didRequestAction: (WeightViewModelAction) -> Void
    let weightViewModel = TextValidationViewModel(model: TextValidationModel(placeholder: "pounds",
                                                                             validationLogic: [ValidationRule(regex: AppConstants.Regex.pound, message: "Invalid height. You can't be shorther than 3ft or taller than 9ft")],
                                                                             keyboardType: .numberPad))
    
    init(didRequestAction: @escaping (WeightViewModelAction) -> Void) {
        self.didRequestAction = didRequestAction
        configureBindings()
    }
    
    func userTappedConfirmWeight() {
        if let weightValue = Int(weightViewModel.text) {
            didRequestAction(.userConfirmedData(weight: Weight.imperial(pounds: weightValue)))
        }
    }
    
    private func configureBindings() {
        weightViewModel.$isDataValid.map { isValid in
            if isValid {
                return ButtonState.enabled
            } else {
                return ButtonState.dissabled
            }
        }.assign(to: &$state)
    }
}

enum WeightViewModelAction {
    case userConfirmedData(weight: Weight)
}

