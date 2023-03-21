//
//  SignUpView.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 12.03.2023.
//

import SwiftUI

struct SignUpScreen: View {
    
    @StateObject var viewModel: SignUpViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Spacer()
                    Image(uiImage: UIImage(named: "normalSkin")!)
                        .resizable()
                        .frame(width: 240, height: 240)
                    Spacer()
                    TextValidationView(viewModel: viewModel.emailViewModel)
                    TextValidationView(viewModel: viewModel.passwordViewModel)
                    Spacer()
                    Toggle(isOn: $viewModel.isTermsOn) {
                        Text("I agree to the")+Text(" ")+Text("Terms and Conditions").foregroundColor(.scPurple)
                    }
                    .padding(.horizontal, 2)
                }
                Button("CREATE ACCOUNT") {
                    signUp()
                }
                .buttonStyle(FilledButtonStyle(state: $viewModel.state))
            }
        }
        .padding()
        .navigationBarTitle("Finish Account", displayMode: .large)
    }
    
    func signUp() {
        viewModel.signUp()
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen(viewModel: SignUpViewModel(userProfile: UserProfile(), didRequestAction: { _ in }))
    }
}
