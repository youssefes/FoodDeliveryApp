//
//  LoginWithEmailScreen.swift
//  Created by Asset's Macbook Pro on 20/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI

struct LoginWithEmailScreen: View {
    @StateObject var viewModel = LoginWithEmailViewModel()
    @EnvironmentObject var coordinator: AppCoordinator
    var body: some View {
        ZStack{
            DesignSystem.Colors.main.color
                .ignoresSafeArea()
            VStack{
                ScrollView(showsIndicators: false){
                    topView
                    inputsView
                    VStack(spacing: Dimensions.d12){
                        SecondaryButton(title: "Continue".localized) {
                            viewModel.login()
                        }
                    }
                }
                .padding()
                Spacer()
                HStack{
                    Spacer()
                    Image("buttomshape")
                        .resizable()
                        .frame(width: Dimensions.d250, height: Dimensions.d80)
                }
            }
            if viewModel.loaging {
                Spacer()
                ShowProgressView()
                    .padding(.bottom, Dimensions.d1)
                Spacer()
            }
            
        }
        .ignoresSafeArea()
        .onChange(of: viewModel.navigate) { oldValue, navigate in
            if navigate {
            }
        }
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
    
    var topView: some View {
        VStack{
            ZStack{
                Image("topshape")
                    .resizable()
                    .frame(height: Dimensions.d300)
                VStack(spacing: Dimensions.d16){
                    Image("logo")
                        .padding(.top, Dimensions.d50)
                        .padding(.bottom, Dimensions.d20)
                    Text("Sign in to your Delivery account and Explore \nour latest exclusive ".localized)
                        .font(Font.custom(AppFont.medium.name, size: Dimensions.d14))
                    Text("use your Email to sign in or sign up".localized)
                        .font(Font.custom(AppFont.medium.name, size: Dimensions.d14))
                }
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            }
        }
    }
    
    var inputsView: some View {
        VStack(spacing: Dimensions.d10){
            InputView(text: $viewModel.email, validated: $viewModel.vaildEmail, keywordType: .emailAddress, placeholder: "Email", validatorType: .email)
            InputView(text: $viewModel.password, validated: $viewModel.vaildPassword, placeholder: "Password", validatorType: .password)
            
            HStack{
                Spacer()
                Button {
                    coordinator.navigate(to: .forgotPassword)
                } label: {
                    Text("Forget Password".localized)
                        .font(Font.custom(AppFont.medium.name, size: Dimensions.d14))
                        .foregroundColor(DesignSystem.Colors.secondary.color)
                }

            }
        }
        .padding(.bottom,Dimensions.d20)
    }
}

#Preview {
    LoginWithEmailScreen()
}
