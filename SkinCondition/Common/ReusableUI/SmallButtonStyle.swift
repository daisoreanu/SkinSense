//
//  SmallButtonStyle.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 17.03.2023.
//

import SwiftUI

struct SmallButtonStyle: ButtonStyle {
    @Binding private var state: ButtonState
    
    init(state: Binding<ButtonState>? = nil) {
        self._state = state ?? Binding.constant(ButtonState.enabled)
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.black)
            .frame(maxWidth: 64, minHeight: 32)
            .background(state == .dissabled ? Color.scLightGray : Color.scLightPurple)
            .font(Font.system(size: 15, weight: Font.Weight.medium))
            .cornerRadius(10)
            .disabled(state != .enabled)
            .overlay(state == .loading ? loadingView : emptyView)
    }
    
    private var loadingView: AnyView {
        AnyView(ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white)))
    }
    
    private var emptyView: AnyView {
        AnyView(EmptyView())
    }
}
