//
//  SkinConditionApp.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 07.02.2023.
//

import SwiftUI
import Foundation
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct SkinConditionApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var rootCoordinator = RootCoordinator()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $rootCoordinator.onboardinCoordinator.navigationPath) {
                switch rootCoordinator.authState {
                case .loading:
                    LoadingScreen()
                case .signedIn:
                    rootCoordinator.authenticatedCoordinator.mainView()
                case .onboarding:
                    rootCoordinator.onboardinCoordinator.mainView()
                }
            }
            .accentColor(.black)
        }
    }
}

