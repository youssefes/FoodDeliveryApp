//
//  StartedScreen.swift
//  Created by Asset's Macbook Pro on 20/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI

struct StartedScreen: View {
    @EnvironmentObject var coordinator: AppCoordinator
    var body: some View {
        VStack{
            Spacer()
            Image("logo")
                .padding(.bottom, Dimensions.d100)
            VStack(spacing: Dimensions.d16){
                Text("Let's get started !".localized)
                    .font(Font.custom(AppFont.medium.name, size: Dimensions.d30))
                Text("Sign in to your Delivery account and Explore \nour latest exclusive ")
                .font(Font.custom(AppFont.medium.name, size: Dimensions.d14))
            }
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            VStack(spacing: Dimensions.d10){
                SecondaryButton(title: "Sign in".localized) {
                    coordinator.navigate(to: .login)
                }
                SecondaryButton(title: "Sign up".localized,backgroundColor: .white,titleColor: .black) {
                    coordinator.navigate(to: .register)
                }
            }
            .padding()
            Spacer()
            Image("logoTran")
        }
        .padding(.top, Dimensions.d30)
        .frame(maxHeight: .infinity)
        .background(DesignSystem.Colors.main.color)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    StartedScreen()
}
