//
//  RootCoordinator.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 14.03.2023.
//

import Foundation
import SwiftUI

class OnboardingCoordinator: ObservableObject {
    
    @Published var navigationPath: NavigationPath
    lazy var viewModifier = OnboardinCoordinatorsModifier(viewForDestination: viewForDestination)
    
    private var userProfile = UserProfile()
    
    init(navigationPath: NavigationPath) {
        self.navigationPath = navigationPath
        print(navigationPath)
    }
    
    func mainView() -> some View {
        return viewForDestination(.main)
            .modifier(viewModifier)
    }
    
    @ViewBuilder
    func viewForDestination(_ destination: OnboardingDestination) -> some View {
        switch destination {
        case .main:
            MainAuthScreen(viewModel: MainAuthViewModel(didRequestAction: self.mainAuthScreenAction))
        case .gender:
            GenderOnboardingScreen(viewModel: GenderOnboardingViewModel(didRequestAction: self.genderScreenAction))
        case .dateOfBirth:
            BirthdayOnboardingScreen(viewModel: BirthdayOnboardingViewModel(didRequestAction: self.birthdayScreenAction))
        case .skinType:
            SkinTypePickerScreen(viewModel: SkinTypePickerViewModel(didRequestAction: self.skinTypePickerScreenAction))
        case .signUp:
            SignUpScreen(viewModel: SignUpViewModel(userProfile: self.userProfile, didRequestAction: self.signUpScreenAction))
        case .height:
            HeightScreen(viewModel: HeightViewModel(didRequestAction: self.heightScreenAction))
        case .weight:
            WeightScreen(viewModel: WeightViewModel(didRequestAction: self.weightScreenAction))
        case .signIn:
            SignInScreen(viewModel: SignInViewModel())
        }
    }
    
    lazy var mainAuthScreenAction: (MainAuthViewModelAction) -> Void = { [weak self]  (action: MainAuthViewModelAction) -> Void in
        guard let strongSelf = self else { return }
        switch action {
        case .getStarted:
            strongSelf.navigationPath.append(OnboardingDestination.gender)
            print(strongSelf.navigationPath)
        case .signIn:
            strongSelf.navigationPath.append(OnboardingDestination.signIn)
        }
    }
    
    lazy var genderScreenAction: (GenderOnboardingViewModelAction) -> Void = { [weak self] (action: GenderOnboardingViewModelAction) -> Void in
        switch action {
        case .genderConfirmed(gender: let gender):
            self?.userProfile.gender = gender
            self?.navigationPath.append(OnboardingDestination.dateOfBirth)
        }
    }
    
    lazy var birthdayScreenAction: (BirthdayOnboardingViewModelAction) -> Void = { [weak self] (action: BirthdayOnboardingViewModelAction) -> Void in
        switch action {
        case .birthdayConfirmed(date: let date):
            self?.userProfile.dateOfBirth = date
            self?.navigationPath.append(OnboardingDestination.height)
        }
    }
    
    lazy var heightScreenAction: (HeightViewModelAction) -> Void = { [weak self] (action: HeightViewModelAction) -> Void in
        switch action {
        case .userConfirmedData(height: let height):
            self?.userProfile.height = height
            self?.navigationPath.append(OnboardingDestination.weight)
        }
    }
    
    lazy var weightScreenAction: (WeightViewModelAction) -> Void = { [weak self] (action: WeightViewModelAction) -> Void in
        switch action {
        case .userConfirmedData(weight: let weight):
            self?.userProfile.weight = weight
            self?.navigationPath.append(OnboardingDestination.skinType)
        }
    }
    
    lazy var skinTypePickerScreenAction: (SkinTypePickerViewModelAction) -> Void = { [weak self] (action: SkinTypePickerViewModelAction) -> Void in
        switch action {
        case .skinTypeConfirmed(skinType: let skinType):
            self?.userProfile.skinType = skinType
            self?.navigationPath.append(OnboardingDestination.signUp)
        }
    }
    
    lazy var signUpScreenAction: (SignUpViewModelAction) -> Void = { [weak self] (action: SignUpViewModelAction) -> Void in
        switch action {
        case .userAuthenticatedWithSuccess:
            print("")
        }
    }
    
    func popToRoot() {
        navigationPath.removeLast(navigationPath.count)
        print(navigationPath.count)
    }
    
}

enum OnboardingDestination {
    case main
    case gender
    case dateOfBirth
    case height
    case weight
    case skinType
    case signUp
    case signIn
}

struct OnboardinCoordinatorsModifier: ViewModifier {
    
    let viewForDestination: (OnboardingDestination) -> any View
    
    func body(content: Content) -> some View {
        content
            .navigationDestination(for: OnboardingDestination.self) { (destination) in
                AnyView(viewForDestination(destination))
            }
    }
}




