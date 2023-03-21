//
//  RootCoordinator.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 17.03.2023.
//

import Foundation
import SwiftUI
import FirebaseAuth
import Combine

class RootCoordinator: ObservableObject {
    
    enum AuthScreenState {
        case loading
        case signedIn
        case onboarding
    }
    
    @Published var authState: AuthScreenState = .loading
    @Published var navigationPath: NavigationPath
    
    @ObservedObject var onboardinCoordinator: OnboardingCoordinator
    @ObservedObject var authenticatedCoordinator: AuthenticatedCoordinator
    
    var anyCancellable: AnyCancellable? = nil
    
    init(navigationPath: NavigationPath = NavigationPath()) {
        self.navigationPath = navigationPath
        self.onboardinCoordinator = OnboardingCoordinator(navigationPath: navigationPath)
        self.authenticatedCoordinator = AuthenticatedCoordinator(navigationPath: navigationPath)
        
        anyCancellable = onboardinCoordinator.$navigationPath.sink { [weak self] (_) in
            self?.objectWillChange.send()
        }
        
        addAuthListener()
    }
    
    private func addAuthListener() {
        Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            guard let self = self else {
                return
            }
            guard user != nil else {
                self.authenticatedCoordinator.popToRoot()
                self.authState = .onboarding
                return
            }
            self.authState = .signedIn
            self.onboardinCoordinator.popToRoot()
        }
    }
    
}
