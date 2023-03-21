//
//  SkinTypePickerScreen.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 06.03.2023.
//

import SwiftUI

struct SkinTypePickerScreen: View {
    
    let viewModel: SkinTypePickerViewModel
    
    var body: some View {
        VStack {
            Text("We need to know your skin type in order to accurately...")
                .modifier(LightBodyTextStyle())
            Spacer()
            SkinTypeCarousel(viewModel: SkinTypeCarouselViewModel(userSelection: viewModel.userSelection(skinType:)))
            Spacer()
            Button.init("I don’t know my skin type") {
                
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
        .navigationBarTitle("What type of skin do you have?", displayMode: .large)
    }
    
}

struct SkinTypePickerScreen_Previews: PreviewProvider {
    static var previews: some View {
        SkinTypePickerScreen(viewModel: SkinTypePickerViewModel(didRequestAction: { _ in }))
    }
}


