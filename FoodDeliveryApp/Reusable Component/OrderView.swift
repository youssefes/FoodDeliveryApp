//
//  OrderView.swift
//  AsyncImageView.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI

struct OrderView: View {
    @ObservedObject var viewModel: MyOrderViewModel
    var order: OrderData
    var trackAction: ((_ orderId: Int) -> Void)
    var body: some View {
        VStack(alignment: .leading,spacing: Dimensions.d10){
            AsyncImageView(url: URL(string: order.restaurantImage))
                .frame(height: Dimensions.d140)
                .cornerRadius(Dimensions.d10)
                
            Text("\(order.restaurant)")
                .font(Font.custom(AppFont.bold.name, size: Dimensions.d16))
                .foregroundColor(.black)
            
            HStack{
                HStack{
                    Text("Order Number:")
                        .font(Font.custom(AppFont.medium.name, size: Dimensions.d12))
                        .foregroundColor(DesignSystem.Colors.title.color)
                    Text(" #\(order.id)")
                        .font(Font.custom(AppFont.medium.name, size: Dimensions.d16))
                        .foregroundColor(DesignSystem.Colors.main.color)
                }
                Spacer()
                HStack{
                    Text("Order Status:")
                        .font(Font.custom(AppFont.medium.name, size: Dimensions.d12))
                        .foregroundColor(DesignSystem.Colors.title.color)
                    Text("\(order.status?.rawValue ?? "")")
                        .font(Font.custom(AppFont.medium.name, size: Dimensions.d14))
                        .foregroundColor(DesignSystem.Colors.description.color)
                }
            }
            if order.status == .delivery {
                trackButton
            }
        }
        .padding(Dimensions.d16)
        .background(.white)
        .cornerRadius(Dimensions.d15)
        .shadow(color:.black.opacity(0.2), radius: Dimensions.d2)
        .padding(.horizontal)
        
    }
    
    var trackButton: some View {
        VStack {
            Button(action: {
                trackAction(order.id)
            }, label: {
                HStack {
                    Text("Track Order")
                        .foregroundColor(DesignSystem.Colors.main.color)
                        .font(.custom(AppFont.medium.name, size: Dimensions.d15))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .frame(height: Dimensions.d43)
                        .overlay(
                            RoundedRectangle(cornerRadius: Dimensions.d8)
                                .stroke(DesignSystem.Colors.main.color, lineWidth: Dimensions.d1)
                        )
                }
            })
            
        }
    }
}
