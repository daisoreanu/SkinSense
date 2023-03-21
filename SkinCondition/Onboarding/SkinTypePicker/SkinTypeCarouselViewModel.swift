//
//  SkinTypePickerViewModel.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 10.03.2023.
//

import SwiftUI
import Combine

class SkinTypeCarouselViewModel: ObservableObject {
    
    var userSelection: (_ skinType: SkinType) -> Void
    let scrollPublisher = CurrentValueSubject<Int, Never>(0)
    
    init(userSelection: @escaping (_: SkinType) -> Void) {
        self.userSelection = userSelection
    }
    
    private func updateXPos(proxy: GeometryProxy, index: Int) {
        if index == 0 {
            let xPos = Int(proxy.frame(in: .global).minX - 16)
            scrollPublisher.send(xPos)
        }
    }
    
    func getCenterCardIndex() -> Int {
        let xPos = -(scrollPublisher.value)
        if xPos < 0 {
            return 0
        }
        var index = xPos / 320
        let offset = xPos % 320
        if offset > 150 {
            index += 1
        }
        return index
    }
    
    func getScale(proxy: GeometryProxy, index: Int) -> CGFloat {
        updateXPos(proxy: proxy, index: index)
        let xPos = proxy.frame(in: .global).minX - 16
        if xPos < 0.0 {
            return 1.0
        }
        if xPos > 20 {
            return 0.8
        }
        let scale: CGFloat = 1.0 - xPos / 100
        return scale
    }
    
}
