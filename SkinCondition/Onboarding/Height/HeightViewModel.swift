//
//  HeightViewModel.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 17.03.2023.
//

import Foundation
import Combine

class HeightViewModel: ObservableObject {
    
    @Published var state: ButtonState = .dissabled
    @Published var metricState: ButtonState = .dissabled
    @Published var imperialState: ButtonState = .enabled
    
    private let didRequestAction: (HeightViewModelAction) -> Void
    
    let feetViewModel = TextValidationViewModel(model: TextValidationModel(placeholder: "feet",
                                                                            validationLogic: [ValidationRule(regex: AppConstants.Regex.feet, message: "Invalid value.")],
                                                                           keyboardType: .numberPad))
    let inchViewModel = TextValidationViewModel(model: TextValidationModel(placeholder: "inches",
                                                                            validationLogic: [ValidationRule(regex: AppConstants.Regex.inch, message: "Invalid value")],
                                                                           keyboardType: .numberPad))
    
    init(didRequestAction: @escaping (HeightViewModelAction) -> Void) {
        self.didRequestAction = didRequestAction
        configureBindings()
    }
    
    func userTappedConfirmWeight() {
        if let feeetValue = Int(feetViewModel.text), let inchValue = Int(inchViewModel.text) {
            didRequestAction(.userConfirmedData(height: Height.imperial(ft: feeetValue, inch: inchValue)))
        }
    }
    
    private func configureBindings() {
        Publishers.CombineLatest(feetViewModel.$isDataValid, inchViewModel.$isDataValid)
            .map { isFeetValid, isInchValid in
                if isFeetValid && isInchValid {
                    return .enabled
                } else {
                    return .dissabled
                }
            }
            .eraseToAnyPublisher()
            .assign(to: &$state)
    }
}

enum HeightViewModelAction {
    case userConfirmedData(height: Height)
}

