//
//  NewPasswordScreen.swift
//  GO
//
//  Created by POMAC-IOS on 04/03/2024.
//

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
                    SecondaryButton(title: "Continue".localized) {
                       
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
    NewPasswordScreen()
}
