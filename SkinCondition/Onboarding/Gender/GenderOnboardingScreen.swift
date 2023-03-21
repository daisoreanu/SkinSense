//
//  GenderOnboardingScreen.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 01.03.2023.
//

import SwiftUI

struct GenderOnboardingScreen: View {
    
    @StateObject var viewModel: GenderOnboardingViewModel
    
    private let gridItems = [GridItem(.adaptive(minimum: 140)), GridItem(.adaptive(minimum: 140))]
    
    var body: some View {
        VStack {
            Text("We need to know your sex to accurately take into consideration skin...")
                .modifier(LightBodyTextStyle())
            Spacer()
            LazyVGrid(columns: gridItems) {
                ForEach(genderData) { item in
                    GenderCell(viewModel: item)
                        .aspectRatio(0.9, contentMode: ContentMode.fit)
                        .onTapGesture {
                            viewModel.select(item)
                        }
                }
            }
            Spacer()
            Button.init("GET STARTED") {
                viewModel.userTappedGetStarted()
            }
            .buttonStyle(FilledButtonStyle(state: $viewModel.state))
        }
        .onDisappear {
            viewModel.resetData()
        }
        .padding()
        .navigationBarTitle("What’s your gender?", displayMode: .large)
    }
}

struct GenderOnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        GenderOnboardingScreen(viewModel: GenderOnboardingViewModel(didRequestAction: { _ in }))
    }
}
