//
//  UserProfileScreen.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 17.03.2023.
//

import SwiftUI

struct UserProfileScreen: View {
    
    @StateObject var vieewModel: UserProfileViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(vieewModel.data) { item in
                        HStack {
                            Text(item.key)
                            Spacer()
                            Text(item.value)
                            Image(uiImage: UIImage(named: "right_ic")!)
                        }
                    }
                    .listRowBackground(Color.clear)
                }
//                .redacted(reason: .placeholder)
                .listStyle(.plain)
                Spacer()
                Button("LOG OUT") {
                    vieewModel.logOut()
                }
                .buttonStyle(FilledButtonStyle())
            }
            .onAppear{
                vieewModel.loadUserProfile()
            }
            .edgesIgnoringSafeArea(.top)
            .padding()
            .navigationBarTitle("Profile", displayMode: .large)
            .background(Color.scSuperlightPurple)
        }
    }
}

struct UserProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileScreen(vieewModel: UserProfileViewModel())
    }
}
