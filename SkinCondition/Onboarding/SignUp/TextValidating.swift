//
//  TextValidating.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 12.03.2023.
//

import Foundation
import UIKit
import Combine
import SwiftUI

public protocol TextValidating: AnyObject, ObservableObject {
    var text: String { get set }
    var alertMessage: String { get }
    var isDataValid: Bool { get }
    var visibilityIcon: String { get }
    var isTextVisible: Bool { get set }
    var dynamicColor: UIColor { get }
    var placeholder: String { get }
    var keyboardType: UIKeyboardType { get }
    var isSecureTextEntry: Bool { get }
    var isTitleNeeded: Bool { get }
    var isAlertNeeded: Bool { get }
}

