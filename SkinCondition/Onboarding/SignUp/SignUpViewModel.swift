//
//  SignUpViewModel.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 12.03.2023.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore

class SignUpViewModel: ObservableObject {
    
    @Published var state: ButtonState = .dissabled
    @Published var isTermsOn: Bool = false
    
    private let didRequestAction: (SignUpViewModelAction) -> Void
    
    private var userProfile: UserProfile
    
    init(userProfile: UserProfile, didRequestAction: @escaping (SignUpViewModelAction) -> Void) {
        self.userProfile = userProfile
        self.didRequestAction = didRequestAction
        configureBindings()
    }
    
    let emailViewModel = TextValidationViewModel(model: TextValidationModel(placeholder: "Email address",
                                                                            validationLogic: [ValidationRule(regex: AppConstants.Regex.email, message: "Invalid name format, error, that can easily get longer than the default hight alocated size of just 1 line of text")],
                                                                            keyboardType: .emailAddress))
    let passwordViewModel = TextValidationViewModel(model: TextValidationModel(placeholder: "Create a password",
                                                                               validationLogic: [ValidationRule(regex: AppConstants.Regex.password, message: "Invalid password format, error, that can easily get longer than the default hight alocated size of just 1 line of text")],
                                                                               isSecureTextEntry: true))
    
    private func configureBindings() {
        Publishers.CombineLatest3(emailViewModel.$isDataValid, passwordViewModel.$isDataValid, $isTermsOn)
            .map { isEmailValid, isPasswordValid, isTermsOn in
                if isEmailValid  && isPasswordValid && isTermsOn {
                    return .enabled
                } else {
                    return .dissabled
                }
            }
            .eraseToAnyPublisher()
            .assign(to: &$state)
    }
    
    func signUp() {
        let email = emailViewModel.text
        let password = passwordViewModel.text
        userProfile.email = email
        didRequestAction(.userAuthenticatedWithSuccess)
        
        state = .loading
        
        Auth.auth().createUser(withEmail: email, password: String(password)) { [weak self] authResult, error in
            guard let user = authResult?.user, error == nil else {
                self?.state = .enabled
                print(error?.localizedDescription)
                return
            }
            print("\(user.uid) created")
            self?.userProfile.uuid = user.uid
            let db = Firestore.firestore()
            let userProfileData = self?.userProfile.dictionary
            db.collection("users").document(self!.userProfile.uuid!).setData(userProfileData!) { error in
                if let error = error{
                    print(error.localizedDescription)
                }
            }
        }
    }
}

enum SignUpViewModelAction {
    case userAuthenticatedWithSuccess
}
