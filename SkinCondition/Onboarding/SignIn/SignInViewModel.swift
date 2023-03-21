//
//  SignInViewModel.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 17.03.2023.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore

class SignInViewModel: ObservableObject {
    
    @Published var state: ButtonState = .dissabled
    
    init() {
        configureBindings()
    }
    
    let emailViewModel = TextValidationViewModel(model: TextValidationModel(placeholder: "Email address",
                                                                            validationLogic: [ValidationRule(regex: AppConstants.Regex.email, message: "Invalid name format, error, that can easily get longer than the default hight alocated size of just 1 line of text")],
                                                                            keyboardType: .emailAddress))
    let passwordViewModel = TextValidationViewModel(model: TextValidationModel(placeholder: "Create a password",
                                                                               validationLogic: [ValidationRule(regex: AppConstants.Regex.password, message: "Invalid password format, error, that can easily get longer than the default hight alocated size of just 1 line of text")],
                                                                               isSecureTextEntry: true))
    
    private func configureBindings() {
        Publishers.CombineLatest(emailViewModel.$isDataValid, passwordViewModel.$isDataValid)
            .map { isEmailValid, isPasswordValid in
                if isEmailValid  && isPasswordValid {
                    return .enabled
                } else {
                    return .dissabled
                }
            }
            .eraseToAnyPublisher()
            .assign(to: &$state)
    }
    
    func signIn() {
        let email = emailViewModel.text
        let password = passwordViewModel.text
        state = .loading
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let strongSelf = self else {
                return
            }
            if let error = error {
                strongSelf.state = .enabled
                print(error.localizedDescription)
            }
        }
    }
}
