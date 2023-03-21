//
//  PlainButtonStyle.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 24.02.2023.
//

import SwiftUI

struct PlainButtonStyle: ButtonStyle {
    
    @Binding private var state: ButtonState
    
    init(state: Binding<ButtonState>? = nil) {
        self._state = state ?? Binding.constant(ButtonState.enabled)
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(state == .loading ? Color.clear : Color.scPurple)
            .frame(maxWidth: .infinity, minHeight: 56)
            .background(Color.clear)
            .font(Font.system(size: 15, weight: Font.Weight.semibold))
            .disabled(state != .enabled)
            .overlay(state == .loading ? loadingView : emptyView)
    }
    
    private var loadingView: AnyView {
        AnyView(ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .purple)))
    }
    
    private var emptyView: AnyView {
        AnyView(EmptyView())
    }
}
