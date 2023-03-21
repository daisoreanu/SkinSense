//
//  GenderCell.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 01.03.2023.
//

import SwiftUI

struct GenderCell: View {
    @ObservedObject var viewModel: GenderViewModel
    var body: some View {
        VStack {
            Image(uiImage: viewModel.image)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 34, height: 34)
            Text(viewModel.title)
        }
        .padding()
        .frame(maxWidth: CGFloat.infinity, maxHeight: CGFloat.infinity)
        .background(viewModel.isSelected ? Color.scLightPurple : Color.scLightGray)
        .foregroundColor(viewModel.isSelected ? Color.scPurple : Color.black)
        .cornerRadius(14)
        .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color.scPurple, lineWidth: viewModel.isSelected ? 2 : 0)
        )
    }
}

struct GenderCell_Previews: PreviewProvider {
    static var previews: some View {
        GenderCell(viewModel: GenderViewModel(isSelected: true, gender: Gender.male))
    }
}
