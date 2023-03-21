//
//  TextStyle.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 01.03.2023.
//

import SwiftUI


struct LightBodyTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 15))
            .foregroundColor(Color.scGray)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
