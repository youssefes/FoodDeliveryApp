//
//  StatusProgressView.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI
struct StatusProgressView: View {
    @Binding var progressStatus: orderStatus
    var body: some View {
        VStack(alignment: .center) {
            switch progressStatus {
            case .processing:
                HStack(alignment: .top, spacing: -Dimensions.d22){
                    StatusCircle(name: orderStatus.processing.rawValue,circleStatus: .processing)
                    Divider()
                        .frame(height: Dimensions.d1)
                        .frame(maxWidth: .infinity)
                        .background(DesignSystem.Colors.borderColor.color)
                        .padding(.top,Dimensions.d5)
                    StatusCircle(name: orderStatus.preparing.rawValue,circleStatus: .notActive)
                        Divider()
                        .frame(height: Dimensions.d1)
                        .frame(maxWidth: .infinity)
                        .background(DesignSystem.Colors.borderColor.color)
                        .padding(.top,Dimensions.d5)
                        .padding(.trailing,Dimensions.d10)
                    StatusCircle(name: orderStatus.delivery.rawValue,circleStatus: .notActive)
                }
            
            case .preparing:
                HStack(alignment: .top, spacing: -Dimensions.d25){
                    StatusCircle(name: orderStatus.processing.rawValue,circleStatus: .done)
                    Divider()
                        .frame(height: Dimensions.d1)
                        .frame(maxWidth: .infinity)
                        .background(DesignSystem.Colors.main.color)
                        .padding(.top,Dimensions.d5)
                    StatusCircle(name: orderStatus.preparing.rawValue,circleStatus: .Preparing)
                        Divider()
                        .frame(height: Dimensions.d1)
                        .frame(maxWidth: .infinity)
                        .background(DesignSystem.Colors.borderColor.color)
                        .padding(.top,Dimensions.d5)
                    StatusCircle(name: orderStatus.delivery.rawValue,circleStatus: .notActive)
                }
         
            case .delivery, .completed:
                HStack(alignment: .top, spacing: -Dimensions.d30){
                    StatusCircle(name: orderStatus.processing.rawValue,circleStatus: .done)
                    Divider()
                        .frame(height: Dimensions.d1)
                        .frame(maxWidth: .infinity)
                        .background(DesignSystem.Colors.main.color)
                        .padding(.top,Dimensions.d5)
                    StatusCircle(name: orderStatus.preparing.rawValue,circleStatus: .done)
                    Divider()
                        .frame(height: Dimensions.d1)
                        .frame(maxWidth: .infinity)
                        .background(DesignSystem.Colors.main.color)
                        .padding(.top,Dimensions.d5)
                        .padding(.trailing)
                    StatusCircle(name: orderStatus.delivery.rawValue,circleStatus: .Preparing)
                }
            case .cancel:
                HStack(alignment: .top, spacing: -Dimensions.d30){
                    StatusCircle(name: orderStatus.cancel.rawValue,circleStatus: .done)
                    Divider()
                        .frame(height: Dimensions.d1)
                        .frame(maxWidth: .infinity)
                        .background(DesignSystem.Colors.main.color)
                        .padding(.top,Dimensions.d5)
                    StatusCircle(name: orderStatus.cancel.rawValue,circleStatus: .done)
                    Divider()
                        .frame(height: Dimensions.d1)
                        .frame(maxWidth: .infinity)
                        .background(DesignSystem.Colors.main.color)
                        .padding(.top,Dimensions.d5)
                        .padding(.trailing)
                    StatusCircle(name: orderStatus.cancel.rawValue,circleStatus: .notActive)
                }
            }
        }
      
    }
}
