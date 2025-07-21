//
//  MenuView.swift
//  Created by Asset's Macbook Pro on 21/07/2025.
//  Copyright © 2025 youssef. All rights reserved.
import SwiftUI

struct MenuView: View {
    @State var iconName: String
    var name: String = ""
    @State var isLogOut: Bool = false
    @State var language: Bool = false
    var body: some View {
        HStack(spacing: Dimensions.d15) {
            if isLogOut {
                Image(systemName: iconName)
                    .frame(width: Dimensions.d10, height: Dimensions.d10, alignment: .center)
                    .font(.custom(AppFont.light.name, size: Dimensions.d16))
                Text(name.localized)
                    .font(.custom(AppFont.bold.name, size: Dimensions.d16))
                    .foregroundColor(.red)
            } else  {
                Image(iconName)
                    .frame(width: Dimensions.d10, height: Dimensions.d10, alignment: .center)
                Text(name.localized)
                    .font(.custom(AppFont.light.name, size: Dimensions.d16))
                
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.bottom , Dimensions.d16)
    }
}

