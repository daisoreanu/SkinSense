//
//  AuthenticatedCoordinator.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 17.03.2023.
//

import Foundation
import SwiftUI
import UIKit

class AuthenticatedCoordinator: ObservableObject {
    
    @Published var navigationPath: NavigationPath
    lazy var viewModifier = AuthenticatedCoordinatorModifier(viewForDestination: viewForDestination)
    
    init(navigationPath: NavigationPath) {
        self.navigationPath = navigationPath
    }
    
    func mainView() -> some View {
        return viewForDestination(.tabBar)
            .modifier(viewModifier)
    }
    
    @ViewBuilder
    func viewForDestination(_ destination: AuthenticatedDestination) -> some View {
        switch destination {
        case .tabBar:
            TabView {
                Text("Home")
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                UserProfileScreen(vieewModel: UserProfileViewModel())
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle")
                    }
            }
        }
    }
    
    func popToRoot() {
        navigationPath.removeLast(navigationPath.count)
        print(navigationPath.count)
    }
    
}

enum AuthenticatedDestination {
    case tabBar
}

struct AuthenticatedCoordinatorModifier: ViewModifier {
    
    let viewForDestination: (AuthenticatedDestination) -> any View
    
    func body(content: Content) -> some View {
        content
            .navigationDestination(for: AuthenticatedDestination.self) { (destination) in
                AnyView(viewForDestination(destination))
            }
    }
}

