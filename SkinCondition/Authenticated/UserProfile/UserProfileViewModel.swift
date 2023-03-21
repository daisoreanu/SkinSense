//
//  UserProfileViewModel.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 17.03.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class UserProfileViewModel: ObservableObject {
    
    @Published var data: [SideBySideModel] = []
    
    func loadUserProfile() {
        guard let userID = Auth.auth().currentUser?.uid else {
            return
            #warning("should switch from loading state to error view")
        }
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(userID)
        docRef.getDocument { (document, error) in
            if let error = error as NSError? {
                let errorMessage = "Error getting document: \(error.localizedDescription)"
                print(errorMessage)
            } else {
                if let documentData = document?.data() {
                    do {
                        let json = try JSONSerialization.data(withJSONObject: documentData)
                        let decoder = JSONDecoder()
                        let userProfile = try decoder.decode(UserProfile.self, from: json)
                        print(userProfile)
                        self.generateData(using: userProfile)
                    }
                    catch {
                        print(error)
                    }
                }
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
    
    private func generateData(using userProfile: UserProfile) {
        data = [
            SideBySideModel(key: "Email", value: userProfile.email ?? ""),
            SideBySideModel(key: "Date of birth", value: userProfile.dateOfBirth?.toString(format: .dayMonthYear) ?? ""),
            SideBySideModel(key: "Gender", value: userProfile.gender?.title ?? ""),
            SideBySideModel(key: "Skin type", value: userProfile.skinType?.title ?? ""),
            SideBySideModel(key: "Height", value: userProfile.height?.asString ?? ""),
            SideBySideModel(key: "Weight", value: userProfile.weight?.asString ?? "")
        ]
    }
    
    
    
}
