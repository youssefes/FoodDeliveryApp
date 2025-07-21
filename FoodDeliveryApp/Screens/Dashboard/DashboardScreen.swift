//
//  DashboardScreen.swift
//  FoodDeliveryApp
//
//  Created by Mader's Macbook Pro on 21/07/2025.
//

import SwiftUI

import SwiftUI

struct DashboardScreen: View {
    @EnvironmentObject var coordinator: AppCoordinator
    var body: some View {
        VStack(alignment: .trailing, spacing: Dimensions.d24) {
            HStack {
                Text("Welcome 👋")
                    .font(.custom(AppFont.bold.name, size: Dimensions.d28))
                Spacer()
                Text("youssef ")
                    .font(.custom(AppFont.bold.name, size: Dimensions.d28))
            }
            .padding(.horizontal)
            HStack {
                VStack(alignment: .trailing,spacing: Dimensions.d6) {
                    Text("Your current requests")
                        .font(.custom(AppFont.bold.name, size: Dimensions.d20))
                    Text("3 requests in progress")
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.gray)
                        .font(.custom(AppFont.light.name, size: Dimensions.d18))
                }
                Spacer()
                Image(systemName: "shippingbox.fill")
                    .font(.system(size: Dimensions.d36))
                    .foregroundColor(DesignSystem.Colors.main.color)
            }
            .padding()
            .background(DesignSystem.Colors.background.color)
            .cornerRadius(Dimensions.d16)
            .padding(.horizontal)

            VStack(spacing: Dimensions.d12) {
                QuickActionButton(title: "View All Orders", icon: "list.bullet.rectangle") {
                    coordinator.navigate(to: .order)
                }
                QuickActionButton(title: "New Order", icon: "plus") {
                    coordinator.navigate(to: .AddNewOrder)
                    
                }
                QuickActionButton(title: "Settings", icon: "gearshape") {
                    coordinator.navigate(to: .Settings)
                }
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding(.top)
    }
}

#Preview {
    DashboardScreen()
}
