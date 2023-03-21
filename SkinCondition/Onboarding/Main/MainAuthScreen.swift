//
//  MainAuthScreen.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 21.02.2023.
//

import SwiftUI

struct MainAuthScreen: View {
    
    let viewModel: MainAuthViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Text("Transform your skin with personalized care.")
                .modifier(LightBodyTextStyle())
            Spacer()
            Image(uiImage: UIImage(named: "normalSkin")!)
                .resizable()
                .frame(width: 240, height: 240)
            Spacer()
            Text("Lorem ipsum dolor sit amet lorem ipsum.")
                .modifier(LightBodyTextStyle())
            Spacer()
            Button.init("SIGN IN") {
                viewModel.userTappedSignIn()
            }
            .buttonStyle(PlainButtonStyle())
            Button.init("GET STARTED") {
                viewModel.userTappedGetStarted()
            }
            .buttonStyle(FilledButtonStyle())
        }
        .padding()
        .navigationBarTitle("SkinSense", displayMode: .large)
    }
}

struct MainAuthScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainAuthScreen(viewModel: MainAuthViewModel.init(didRequestAction: { action in }))
    }
}





