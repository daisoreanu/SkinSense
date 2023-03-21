//
//  HeightScreen.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 17.03.2023.
//

import SwiftUI

struct HeightScreen: View {
    
    @StateObject var viewModel: HeightViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Spacer()
                    Text("We ask for your height in order to provide you with the most personalized and accurate skincare recommendations.")
                        .modifier(LightBodyTextStyle())
                    Spacer()
                    HStack {
                        TextValidationView(viewModel: viewModel.feetViewModel)
                        TextValidationView(viewModel: viewModel.inchViewModel)
                    }
                    Spacer()
                    HStack {
                        Button("ft/in") {
#warning("Needs implementation")
                        }
                        .buttonStyle(SmallButtonStyle(state: $viewModel.imperialState))
                        Button("cm") {
#warning("Needs implementation")
                        }
                        .buttonStyle(SmallButtonStyle(state: $viewModel.metricState))
                        Spacer()
                    }
                }
                Button("Continue") {
                    viewModel.userTappedConfirmWeight()
                }
                .buttonStyle(FilledButtonStyle(state: $viewModel.state))
            }
        }
        .padding()
        .navigationBarTitle("How tall are you?", displayMode: .large)
    }
}

struct HeightScreen_Previews: PreviewProvider {
    static var previews: some View {
        HeightScreen(viewModel: HeightViewModel(didRequestAction: { _ in }))
    }
}
