//
//  ForgetPasswordScreen.swift
//  Created by Asset's Macbook Pro on 21/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI

struct ForgetPasswordScreen: View {
    @StateObject var viewModel = ForgetPasswordViewModel()
    @EnvironmentObject var coordinator: AppCoordinator
    var body: some View {
        ZStack{
            VStack{
                ScrollView(showsIndicators: false){
                    VStack(spacing: 10){
                        ZStack{
                            Image("topshape")
                            VStack(spacing: 16){
                                Image("logo")
                                    .padding(.bottom, 30)
                                Text("Forget Password".localized)
                                    .font(Font.custom(AppFont.bold.name, size: 18))
                                    .foregroundColor(DesignSystem.Colors.secondary.color)
                                Text("Don't worry, we will send you an OTP code by Email and reset your password".localized)
                                    .font(Font.custom(AppFont.medium.name, size: 14))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                            }
                          
                        }
                        
                        InputView(text: $viewModel.email, validated: $viewModel.vaildEmail, keywordType: .emailAddress, placeholder: "Email", validatorType: .email)
                        .padding(.horizontal)
                        
                        VStack(spacing: 12){
                            SecondaryButton(title: "Send".localized) {
                                viewModel.forgetPassword()
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.horizontal)
            }
            .onChange(of: viewModel.navigate) { oldValue ,navigate in
                if navigate {
                    coordinator.navigate(to: .newPassword)
                }
            }
            if viewModel.loaging {
                Spacer()
                ShowProgressView()
                    .padding(.bottom, 1)
                Spacer()
            }
        }
        .alert(viewModel.error, isPresented: $viewModel.hasError, actions: {})
        .ignoresSafeArea()
        .background(DesignSystem.Colors.main.color)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    coordinator.pop()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white) // arrow color
                }
            }
        }
    }
}

#Preview {
    ForgetPasswordScreen()
}
