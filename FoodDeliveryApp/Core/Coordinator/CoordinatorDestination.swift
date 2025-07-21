//
//  CoordinatorDestination.swift
//  mutwafa
//
//  Created by Mader's Macbook Pro on 10/07/2025.
//

import Foundation
import SwiftUI

extension View {
    func CoordinatorDestination() -> some View {
        self.navigationDestination(for: AppScreens.self) { Screen in
            switch Screen {
            case .onborading:
                OnboardingScreen()
            case .login:
                LoginWithEmailScreen()
            case .register:
                SignUpScreen()
            case .start:
                StartedScreen()
            case .forgotPassword:
                ForgetPasswordScreen()
            case .newPassword:
                NewPasswordScreen()
            case .order:
                MyOrdersScreen()
            case .orderDetails(let id):
                OrderDetailsScreen(orderId: id)
            case .Settings:
                SettingsScreen()
            case .AddNewOrder:
                AddNewOrderView()
            case .dashboard:
                DashboardScreen()
            }
        }
    }
}
