//
//  WeightScreen.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 17.03.2023.
//

import SwiftUI

struct WeightScreen: View {
    
    @StateObject var viewModel: WeightViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Spacer()
                    Text("We ask for your weight in order to provide you with the most personalized and accurate skincare recommendations.")
                        .modifier(LightBodyTextStyle())
                    Spacer()
                    TextValidationView(viewModel: viewModel.weightViewModel)
                    Spacer()
                    HStack {
                        Button("lb") {
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
        .navigationBarTitle("What’s your weight?", displayMode: .large)
    }
}

struct WeightScreen_Previews: PreviewProvider {
    static var previews: some View {
        WeightScreen(viewModel: WeightViewModel(didRequestAction: { _ in }))
    }
}
