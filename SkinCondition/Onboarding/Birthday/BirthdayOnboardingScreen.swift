//
//  BirthdayOnboardingScreen.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 02.03.2023.
//

import SwiftUI

struct BirthdayOnboardingScreen: View {
    
    @ObservedObject var viewModel: BirthdayOnboardingViewModel
    
    var body: some View {
        VStack {
            Text("We need your age to accurately calculate your skin... and some other stuff")
                .modifier(LightBodyTextStyle())
            Spacer()
            DatePicker("Birthday", selection: $viewModel.selectedDate, in: viewModel.maxDate...viewModel.minDate, displayedComponents: .date)
                .datePickerStyle(.graphical)
                .labelsHidden()
                .accentColor(Color.scPurple)
            Button("Continue") {
                viewModel.userTappedConfirmBirthday()
            }
            .buttonStyle(FilledButtonStyle())
        }
        .padding()
        .navigationBarTitle("When is your birthday?", displayMode: .large)
    }
}

struct BirthdayOnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        BirthdayOnboardingScreen(viewModel: BirthdayOnboardingViewModel(didRequestAction: { _ in }))
    }
}
