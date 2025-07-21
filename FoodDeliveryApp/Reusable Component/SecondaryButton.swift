//
//  SecondaryButton.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI

struct SecondaryButton: View {
    var title: String
    var fontSize: CGFloat = 14
    var height: CGFloat = 56
    var backgroundColor = DesignSystem.Colors.secondary.color
    var titleColor: Color = .white
    var clicked: (() -> Void)
    var body: some View {
        VStack {
            HStack {
                Button {
                    clicked()
                } label: {
                    HStack {
                        Spacer()
                        Text(title.localized)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(backgroundColor)
                }
            }
        }
        .font(.custom(AppFont.medium.name, size: fontSize))
        .foregroundColor(titleColor)
        .frame(height: height)
        .cornerRadius(12)
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton(title: "Login", clicked: {
            
        })
    }
}
