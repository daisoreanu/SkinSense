//
//  TextValidationViewModel.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 12.03.2023.
//

import Foundation
import UIKit
import Combine
import SwiftUI

public class TextValidationViewModel: ObservableObject {
    
    private enum VisibilityIcon: String {
        case visible = "eye.circle"
        case hidden = "eye.slash.circle"
    }
    
    private var model: TextValidationModel
    private var cancellables = Set<AnyCancellable>()
    private var validationState = CurrentValueSubject<ValidationState, Never>(.empty)
    
    @Published public var text: String {
        didSet { model.text.value = text }
    }
    @Published public var alertMessage: String = ""
    @Published public var isDataValid: Bool = false
    @Published public var dynamicColor: UIColor = .gray
    @Published public var visibilityIcon: String = VisibilityIcon.hidden.rawValue
    @Published public var isTextVisible: Bool
    
    init(model: TextValidationModel) {
        self.model = model
        self.text = model.text.value
        self.isTextVisible = model.isSecureTextEntry
        configureBindings()
    }
}

private extension TextValidationViewModel {
    func configureBindings() {
        //Subscribe to model.text and update validation state
        model.text.map { text in
            guard text.count > 0 else {
                return ValidationState.empty
            }
            for rule in self.model.validationLogic {
                if case .invalid(let message) = text.isValid(rule) {
                    return ValidationState.invalid(message)
                }
            }
            return ValidationState.valid
        }
        .sink { validationState in
            self.validationState.value = validationState
        }
        .store(in: &cancellables)
        
        //Subscribe to validationState and update: dynamicColor, alertMessage, isDataValid
        validationState.sink { validationState in
            self.updateAlertMessage(validationState)
            self.updateIsDataValid(validationState)
            self.updateDynamicColor(validationState)
        }
        .store(in: &cancellables)
        
        //Update the icon
        $isTextVisible.map { isSecure -> String in
            if isSecure {
                return VisibilityIcon.visible.rawValue
            } else {
                return VisibilityIcon.hidden.rawValue
            }
        }.assign(to: &$visibilityIcon)
    }
    
    func updateAlertMessage(_ validationState: ValidationState) {
        switch validationState {
        case .empty:
            alertMessage = ""
        case .valid:
            alertMessage = ""
        case .invalid(let message):
            alertMessage = message
        }
    }
    
    func updateIsDataValid(_ validationState: ValidationState) {
        if case .valid = validationState {
            isDataValid = true
        } else {
            isDataValid = false
        }
    }
    
    func updateDynamicColor(_ validationState: ValidationState) {
        switch validationState {
        case .empty:
            dynamicColor = .gray
        case .valid:
            dynamicColor = .black
        case .invalid( _):
            dynamicColor = .red
        }
    }
}


//Would be nice to use a protocol between view and ViewModel
//extension TextValidationViewModel: TextValidation {
extension TextValidationViewModel: TextValidating {
    public var placeholder: String {
        return model.placeholder
    }
    public var keyboardType: UIKeyboardType {
        return model.keyboardType
    }
    public var isSecureTextEntry: Bool {
        return model.isSecureTextEntry
    }
    public var isTitleNeeded: Bool {
        return model.isTitleNeeded
    }
    public var isAlertNeeded: Bool {
        return model.isAlertNeeded
    }
}
