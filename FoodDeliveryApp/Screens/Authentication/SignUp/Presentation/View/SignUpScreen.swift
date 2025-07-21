//
//  SignUpScreen.swift
//  Created by Asset's Macbook Pro on 21/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI

struct SignUpScreen: View {
    @StateObject var viewModel = SignUpViewModel()
    @EnvironmentObject var coordinator: AppCoordinator
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    ZStack{
                        Image("topshape")
                            .resizable()
                            .frame(height: Dimensions.d300)
                        VStack(spacing: Dimensions.d10){
                            Image("logo")
                                .padding(.bottom, Dimensions.d20)
                            
                            Text("Create Password")
                                .font(Font.custom(AppFont.bold.name, size: Dimensions.d25))
                            
                            Text("Choose a strong password and Make sure  to remember it  ")
                                .font(Font.custom(AppFont.medium.name, size: Dimensions.d15))
                        }
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: Dimensions.d250)
                    VStack(spacing: Dimensions.d20){
                        VStack(spacing: Dimensions.d16){
                            InputView(text: $viewModel.name, validated: $viewModel.vaildName, keywordType: .emailAddress, placeholder: "Name", validatorType: .email)
                            InputView(text: $viewModel.email, validated: $viewModel.vaildEmail, keywordType: .emailAddress, placeholder: "Email", validatorType: .email)
                           
                            InputView(text: $viewModel.password, validated: $viewModel.vaildPassword, placeholder: "Password", validatorType: .password)
                            
                            InputView(text: $viewModel.confirmPassword, validated: $viewModel.vaildConfirmPassword, placeholder: "Confirm Password", validatorType: .confirmPassword(password: viewModel.password),isconfirmPassword: true)
                        }
                        
                        VStack(spacing: Dimensions.d5){
                            SecondaryButton(title: "Continue".localized) {
                                viewModel.register()
                            }
                        }
                    }
                    .padding(.horizontal, Dimensions.d10)
                    .alert(viewModel.error, isPresented: $viewModel.hasError, actions: {})
                }
                .padding()
            }
            .padding(.bottom, Dimensions.d40)
            
            if viewModel.loaging {
                Spacer()
                ShowProgressView()
                    .padding(.bottom, Dimensions.d1)
                Spacer()
            }
        }
        .onChange(of: viewModel.navigate, perform: { newValue in

        })
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
    SignUpScreen()
}
