//
//  FilledButtonStyle.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 24.02.2023.
//

import SwiftUI

struct FilledButtonStyle: ButtonStyle {
    
    @Binding private var state: ButtonState
    
    init(state: Binding<ButtonState>? = nil) {
        self._state = state ?? Binding.constant(ButtonState.enabled)
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(state == .loading ? Color.clear : Color.white)
            .frame(maxWidth: .infinity, minHeight: 56)
            .background(state == .dissabled ? Color.scAlphaPurple : Color.scPurple)
            .font(Font.system(size: 15, weight: Font.Weight.semibold))
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
