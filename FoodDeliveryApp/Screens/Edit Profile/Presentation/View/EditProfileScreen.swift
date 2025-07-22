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
        BaseView(state: $viewModel.state) {
            content
        }
    }
    
    var content: some View {
        ZStack{
            VStack(spacing: Dimensions.d10){
                InputView(text: $viewModel.userName, validated: $viewModel.vaildUserName, keywordType: .emailAddress, placeholder: "Name", validatorType: .required(localizedFieldName: ""))
                InputView(text: $viewModel.email, validated: $viewModel.vaildEmail, keywordType: .emailAddress, placeholder: "Email", validatorType: .email)
    
                VStack(spacing: Dimensions.d5){
                    MainButton(title: "Save") {
                        viewModel.UpdateProfile()
                    }
                    .padding(.top)
                }
                Spacer()
            }.padding()
        }
        .background(DesignSystem.Colors.background.color)
        .navigationBarBackButtonHidden(true)
        .alert("Success", isPresented: $viewModel.showUpdateScucess, actions: {
            Button("OK", role: .cancel) {}
        }, message: {
            Text(viewModel.resulteMassage)
        })
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    coordinator.pop()
                }) {
                    HStack(spacing: Dimensions.d20){
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black) // arrow color
                        Text("Profile")
                            .font(.custom(AppFont.bold.name, size: Dimensions.d24))
                            .foregroundStyle(.black)
                    }
                }
            }
        }
        .task {
            viewModel.getProfile()
        }
    }
}

#Preview {
    EditProfileScreen()
}
