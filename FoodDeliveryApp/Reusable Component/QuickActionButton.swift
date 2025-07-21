//
//  QuickActionButton.swift
//  FoodDeliveryApp
//
//  Created by Mader's Macbook Pro on 21/07/2025.
//
import SwiftUI

struct QuickActionButton: View {
    let title: String
    let icon: String
    var onTap: (() -> Void )
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
                .padding()
                .background(DesignSystem.Colors.main.color)
                .clipShape(Circle())

            Text(title)
                .foregroundColor(.black)
                .font(.body)

            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(Dimensions.d12)
        .shadow(color: Color.black.opacity(0.05), radius: Dimensions.d2, x: Dimensions.d0, y: Dimensions.d2)
        .onTapGesture {
            onTap()
        }
    }
}
