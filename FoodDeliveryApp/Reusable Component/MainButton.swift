//
//  MainButton.swift
//  Created by Asset's Macbook Pro on 20/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI

struct MainButton: View {
    var title: String
    var fontSize: CGFloat = Dimensions.d16
    var height: CGFloat = Dimensions.d46
    var clicked: (() -> Void)
    var body: some View {
        VStack {
            HStack {
                Button {
                    clicked()
                } label: {
                    HStack {
                        Spacer()
                        Text(title)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(DesignSystem.Colors.main.color)
                }
            }
        }
        .font(.custom(AppFont.bold.name, size: fontSize))
        .foregroundColor(.white)
        .frame(height: height)
        .cornerRadius(4)
    }
}
