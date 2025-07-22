//
//  SignUpScreen.swift
//  Created by Asset's Macbook Pro on 21/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI

struct SignUpScreen: View {
    @StateObject var viewModel = SignUpViewModel()
    @EnvironmentObject var coordinator: AppCoordinator
    var body: some View {
        BaseView(state: $viewModel.state, content: {
            contentView
        })
        .onChange(of: viewModel.navigate) { oldValue, newValue in
            if newValue{
                coordinator.navigate(to: .dashboard(fromLogin: true))
            }
        }
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
    
    var contentView: some View {
        ZStack{
            ScrollView{
                VStack{
                    topView
                    
                    VStack(spacing: Dimensions.d20){
                        inputFields
            
                        VStack(spacing: Dimensions.d5){
                            SecondaryButton(title: "Continue".localized) {
                                viewModel.register()
                            }
                        }
                    }
                    .padding(.horizontal, Dimensions.d10)
                }
                .padding()
            }
            .padding(.bottom, Dimensions.d40)
        }
        .background(DesignSystem.Colors.main.color)
    }
    
    var topView: some View {
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
    }
    
    var inputFields: some View {
        VStack(spacing: Dimensions.d16){
            InputView(text: $viewModel.name, validated: $viewModel.vaildName, keywordType: .emailAddress, placeholder: "Name", validatorType: .required(localizedFieldName: ""))
            InputView(text: $viewModel.email, validated: $viewModel.vaildEmail, keywordType: .emailAddress, placeholder: "Email", validatorType: .email)
           
            InputView(text: $viewModel.password, validated: $viewModel.vaildPassword, placeholder: "Password", validatorType: .password)
            
            InputView(text: $viewModel.confirmPassword, validated: $viewModel.vaildConfirmPassword, placeholder: "Confirm Password", validatorType: .confirmPassword(password: viewModel.password),isconfirmPassword: true)
        }
    }
}

#Preview {
    SignUpScreen()
}
