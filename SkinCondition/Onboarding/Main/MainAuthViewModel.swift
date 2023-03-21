//
//  MainAuthViewModel.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 15.03.2023.
//

import Foundation

class MainAuthViewModel {
    
    private let didRequestAction: (MainAuthViewModelAction) -> Void
    
    init(didRequestAction: @escaping (MainAuthViewModelAction) -> Void) {
        self.didRequestAction = didRequestAction
    }
    
    func userTappedGetStarted() {
        didRequestAction(.getStarted)
    }
    
    func userTappedSignIn() {
        didRequestAction(.signIn)
    }
    
}

enum MainAuthViewModelAction {
    case getStarted
    case signIn
}
