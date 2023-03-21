//
//  SkinTypeCell.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 07.03.2023.
//

import SwiftUI

struct SkinTypeCell: View {
    
    private let viewModel: SkinTypeViewModel
    
    init(viewModel: SkinTypeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                Spacer().frame(height: 24)
                Image(uiImage: viewModel.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                textDefinition(for: viewModel.title, definition: viewModel.description)
                    .padding(EdgeInsets(top: 24, leading: 24, bottom: 24, trailing: 24))
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.scLightPurple)
            .cornerRadius(16)
//            .overlay {
//                RoundedRectangle(cornerRadius: 16)
//                    .stroke(Color.scPurple, lineWidth: 2)
////                    .foregroundColor(.white) //TODO: should be saved in styles
//            }
        }
    }
    
    private func textDefinition(for word: String, definition: String) -> Text {
        return Text(word).font(Font.system(size: 14, weight: Font.Weight.semibold)) + Text(definition).foregroundColor(Color.scGray).font(Font.system(size: 14, weight: Font.Weight.regular))
    }
    
}

struct SkinTypeCell_Previews: PreviewProvider {
    static var previews: some View {
        SkinTypeCell(viewModel: skinTypesData.first!)
    }
}
