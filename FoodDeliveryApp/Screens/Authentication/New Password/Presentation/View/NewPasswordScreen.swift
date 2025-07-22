//
//  NewPasswordScreen.swift
//  Created by Asset's Macbook Pro on 21/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI

struct NewPasswordScreen: View {
    @StateObject var viewModel = NewPasswordViewModel()
    @EnvironmentObject var coordinator: AppCoordinator
    var body: some View {
        ZStack{
            VStack(spacing: 20){
                InputView(text: $viewModel.password, validated: $viewModel.vaildpassword, placeholder: "Password", validatorType: .password)
                
                InputView(text: $viewModel.confirmPassword, validated: $viewModel.vaildconfirmPassword, placeholder: "Confirm Password", validatorType: .confirmPassword(password: viewModel.password),isconfirmPassword: true)
                VStack(spacing: 5){
                    MainButton(title: "Send".localized) {
                       
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 150)
            .onChange(of: viewModel.changePasswordDone) { oldValue, navigate in
                if navigate {
//                    coordinator.push(.o)
                }
            }
        }
        .alert(viewModel.error, isPresented: $viewModel.hasError, actions: {})
        .ignoresSafeArea()
        .background(DesignSystem.Colors.background.color)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    coordinator.pop()
                }) {
                    HStack(spacing: Dimensions.d20){
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black) // arrow color
                        Text("New Password")
                            .font(.custom(AppFont.bold.name, size: Dimensions.d24))
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    NewPasswordScreen()
}
