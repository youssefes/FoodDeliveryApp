//
//  MainButton.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI

struct MainButton: View {
    var title: String
    var fontSize: CGFloat = 20
    var height: CGFloat = 50
    var cornerRadius : CGFloat = 12
    var  backgroundColor : Color = DesignSystem.Colors.main.color
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
                    .background(backgroundColor)
                }
            }
        }
        .font(.custom(AppFont.bold.name, size: fontSize))
        .foregroundColor(.white)
        .frame(height: height)
        .cornerRadius(cornerRadius)
    }
}

