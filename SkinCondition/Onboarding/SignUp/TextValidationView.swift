//
//  TextValidationView.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 12.03.2023.
//

import SwiftUI
import Combine

struct TextValidationView<ViewModel>: View where ViewModel: TextValidating {
    
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            plainTextView
            dividerView
            if viewModel.isAlertNeeded {
                errorView
            }
        }
    }
    
    private var plainTextView: some View {
        HStack {
            ZStack(alignment: .leading) {
                Text(viewModel.placeholder)
                    .foregroundColor(Color(uiColor: viewModel.dynamicColor))
                    .offset(y: viewModel.text.isEmpty ? 0 : -25)
                    .scaleEffect(viewModel.text.isEmpty ? 1 : 0.75, anchor: .leading)
                if viewModel.isTextVisible {
                    SecureField("", text: $viewModel.text)
                } else {
                    TextField("", text: $viewModel.text)
                }
            }
            .padding(.top, 15)
            .animation(.spring(response: 0.4, dampingFraction: 0.3))
            if viewModel.isSecureTextEntry {
                Button(action: passwordAction) {
                    Image(systemName: viewModel.visibilityIcon)
                        .foregroundColor(Color(uiColor: viewModel.dynamicColor))
                }
                .offset(y: 5)
            }
        }
    }
    
    private var dividerView: some View {
        Rectangle()
            .foregroundColor(Color(uiColor: viewModel.dynamicColor))
            .frame(height: 1)
    }
    
    private var errorView: some View {
        Text(viewModel.alertMessage)
            .lineLimit(2)
            .font(.caption)
            .foregroundColor(Color(uiColor: viewModel.dynamicColor))
            .frame(height: 32)
            .multilineTextAlignment(.leading)
    }
    
    private func passwordAction() {
        viewModel.isTextVisible = !viewModel.isTextVisible
    }
}

struct TextValidationView_Previews: PreviewProvider {
    static var previews: some View {
        let textValidationModel = TextValidationModel(placeholder: "Email address", validationLogic: [])
        let textValidationViewModel = TextValidationViewModel(model: textValidationModel)
        TextValidationView(viewModel: textValidationViewModel)
    }
}
