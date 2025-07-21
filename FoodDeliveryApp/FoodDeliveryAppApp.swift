//
//  FoodDeliveryAppApp.swift
//  FoodDeliveryApp
//
//  Created by Asset's Macbook Pro on 01/07/2025.
//

import SwiftUI

@main
struct FoodDeliveryAppApp: App {
    @StateObject var coordinator = AppCoordinator()
    var body: some Scene {
        WindowGroup {
            if UserUtilites.onboarded() {
                StartedScreen()
                    .environmentObject(coordinator)
            } else {
                OnboardingScreen()
            }
        }
    }
}
