//
//  SignInScreen.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 17.03.2023.
//

import SwiftUI

struct SignInScreen: View {
    @StateObject var viewModel: SignInViewModel
    
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
                }
                Button.init("Forgot password?") {
                    
                }
                .buttonStyle(PlainButtonStyle())
                Button("SIGN IN") {
                    viewModel.signIn()
                }
                .buttonStyle(FilledButtonStyle(state: $viewModel.state))
            }
        }
        .padding()
        .navigationBarTitle("Welcome back", displayMode: .large)
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen(viewModel: SignInViewModel())
    }
}
