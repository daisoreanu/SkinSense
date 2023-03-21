//
//  SkinTypeCarousel.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 07.03.2023.
//

import SwiftUI
import Combine

struct SkinTypeCarousel: View {
    
    @ObservedObject var viewModel: SkinTypeCarouselViewModel
    
    var body: some View {
        ZStack {
            ScrollViewReader { scrollViewProxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(Array(skinTypesData.enumerated()), id: \.offset) { index, skinTypeViewModel in
                            GeometryReader { innerGeometry in
                                let scale = viewModel.getScale(proxy: innerGeometry, index: index)
                                SkinTypeCell(viewModel: skinTypeViewModel)
                                    .shadow(radius: 3, x: 3, y: 3)
                                    .scaleEffect(CGSize(width: scale, height: scale), anchor: .leading)
                                    .animation(.easeOut(duration: 0.1))
                                    .id(index)
                                    .onTapGesture {
                                        viewModel.userSelection(skinTypeViewModel.skinType)
                                    }
                            }
                            .frame(width: 300, height: 400)
                            .padding(.vertical, 5)
                        }
                    }
                    .onReceive(viewModel.scrollPublisher.debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)) { value in
                        withAnimation {
                            scrollViewProxy.scrollTo(viewModel.getCenterCardIndex(), anchor: .leading)
                        }
                    }
                }
            }
        }
    }
}


struct SkinTypeCarousel_Previews: PreviewProvider {
    static var previews: some View {
        SkinTypeCarousel(viewModel: SkinTypeCarouselViewModel.init(userSelection: { _ in }))
    }
}
