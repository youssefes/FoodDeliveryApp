//
//  MyProfileScreen.swift
//  GO
//
//  Created by Ahmed Eltrass on 25/02/2024.
//

import SwiftUI

struct EditProfileScreen: View {
    @StateObject var viewModel = EditProfileViewModel()
    @EnvironmentObject var coordinator: AppCoordinator
    var body: some View {
        ZStack{
            VStack(spacing: 10){
                InputView(text: $viewModel.userName, validated: $viewModel.vaildUserName, keywordType: .emailAddress, placeholder: "Name", validatorType: .email)
                InputView(text: $viewModel.email, validated: $viewModel.vaildEmail, keywordType: .emailAddress, placeholder: "Email", validatorType: .email)
    
                VStack(spacing: 5){
                    MainButton(title: "Save") {
                        viewModel.UpdateProfile()
                    }
                    .padding(.top)
                }
                Spacer()
            }.padding()
        }
        .background(DesignSystem.Colors.background.color)
        .toolbar(.hidden, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    coordinator.pop()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black) // arrow color
                }
            }
        }
    }
}

#Preview {
    EditProfileScreen()
}
