//
//  StatusCircle.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI
enum CircleStatus {
    case done
    case processing
    case Preparing
    case notActive
}
struct StatusCircle: View {
    @State var colorOfStatus: Color = DesignSystem.Colors.main.color
    var name: String = ""
    var circleStatus: CircleStatus = .processing
    var body: some View {
        VStack(alignment: .center,spacing: Dimensions.d16) {
            HStack() {
                if circleStatus == .done {
                    Circle()
                        .fill(colorOfStatus)
                        .frame(width: Dimensions.d10, height: Dimensions.d10)
                        .overlay {
                            Circle()
                                .fill(colorOfStatus)
                                .frame(width: Dimensions.d32, height: Dimensions.d32)
                                .overlay {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.white)
                                }
                        }
                } else {
                    Circle()
                        .fill(colorOfStatus)
                        .frame(width: Dimensions.d10, height: Dimensions.d10)
                        .overlay {
                            Circle()
                                .fill(.clear)
                                .frame(width: Dimensions.d32, height: Dimensions.d32)
                                .overlay {
                                    Circle()
                                        .stroke(colorOfStatus, lineWidth: Dimensions.d1)
                                }
                        }
                }
            }
            Text(name)
                .font((circleStatus == .notActive ) ? Font.custom(AppFont.medium.name, size: Dimensions.d15) : Font.custom(AppFont.bold.name, size: Dimensions.d15))
                .foregroundColor(.black)
        }
        .onAppear{
            switch circleStatus {
            case .done:
                colorOfStatus = DesignSystem.Colors.main.color
            case .processing:
                colorOfStatus = DesignSystem.Colors.main.color
            case .Preparing:
                colorOfStatus = DesignSystem.Colors.secondary.color
            case .notActive:
                colorOfStatus = DesignSystem.Colors.borderColor.color
            }
        }
    }
}

#Preview {
    StatusCircle()
}
