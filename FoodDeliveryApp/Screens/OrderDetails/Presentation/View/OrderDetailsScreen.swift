//
//  OrderDetailsScreen.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI

struct OrderDetailsScreen: View {
    @StateObject var viewModel =  OrderDetailsViewModel()
    @EnvironmentObject var coordinator: AppCoordinator
    var orderId: Int
    var body: some View {
        BaseView(state: $viewModel.state) {
            ScrollView{
                VStack{
                    StatusProgressView(progressStatus: $viewModel.orderStatus)
                        .padding()
                    orderDetailsView
                }
                .task{
                    viewModel.getOrderDetails(orderId: orderId)
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        coordinator.pop()
                    }) {
                        HStack(spacing: 20){
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black) // arrow color
                            Text("Order Details")
                                .font(.custom(AppFont.bold.name, size: 24))
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
        }
    }
    
    var orderDetailsView: some View {
        VStack(spacing: Dimensions.d20) {
            AsyncImageView(url: URL(string: viewModel.orderDetails?.restaurantImage ?? ""))
                .frame(height: Dimensions.d150)
                .cornerRadius(Dimensions.d12)
            resturantView
            addressTime
            orderSummery
        }
        .padding()
    }
    
    var resturantView: some View {
        HStack {
            HStack(spacing: Dimensions.d8) {
                AsyncImageView(url: URL(string: viewModel.orderDetails?.restaurantImage ?? ""))
                    .frame(width: Dimensions.d80,height: Dimensions.d80)
                    .cornerRadius(Dimensions.d8)
                VStack(alignment: .leading,spacing: Dimensions.d10){
                    Text(viewModel.orderDetails?.restaurant ?? "")
                        .font(.custom(AppFont.bold.name, size: Dimensions.d15))
                        .foregroundColor(.black)
                    Text("FastFood")
                        .font(.custom(AppFont.bold.name, size: Dimensions.d15))
                        .foregroundColor(.black)
                }
            }
            .padding(.leading , Dimensions.d6)
            
            Spacer()
            
            HStack{
                Button(action: {}, label: {
                    ZStack{
                        Circle()
                            .fill(DesignSystem.Colors.main.color)
                            .frame(width: Dimensions.d40, height: Dimensions.d40)
                        Image("phone")
                    }
                    
                })
                
                Button(action: {}, label: {
                    ZStack{
                        Circle()
                            .fill(DesignSystem.Colors.main.color)
                            .frame(width: Dimensions.d40, height: Dimensions.d40)
                        Image("massage")
                    }
                    
                })
            }
            .padding(.trailing)
        }
        .foregroundColor(.clear)
        .frame(height: Dimensions.d100)
        .cornerRadius(Dimensions.d15)
        .overlay(
            RoundedRectangle(cornerRadius: Dimensions.d15)
                .inset(by: 0.5)
                .stroke(DesignSystem.Colors.borderColor.color, lineWidth: Dimensions.d1)
        )
    }
    
    var orderSummery: some View {
        VStack{
            VStack{
                HStack{
                    Text("Subtotal")
                        .font(.custom(AppFont.medium.name, size: Dimensions.d16))
                        .foregroundColor(.black)
                    Spacer()
                    HStack{
                        Text(viewModel.orderDetails?.subTotal ?? "")
                            .font(.custom(AppFont.medium.name, size: Dimensions.d19))
                            .foregroundColor(.black)
                        Text("EG")
                            .font(.custom(AppFont.medium.name, size: Dimensions.d12))
                            .foregroundColor(DesignSystem.Colors.title.color)
                    }
                }
                .padding(.top)
                
                Divider()
                    .foregroundColor(DesignSystem.Colors.borderColor.color)
                
                HStack{
                    Text("Delivery")
                        .font(.custom(AppFont.medium.name, size: Dimensions.d16))
                        .foregroundColor(.black)
                    Spacer()
                    HStack{
                        Text(viewModel.orderDetails?.delivery ?? "")
                            .font(.custom(AppFont.medium.name, size: Dimensions.d19))
                            .foregroundColor(.black)
                        Text("EG")
                            .font(.custom(AppFont.medium.name, size: Dimensions.d12))
                            .foregroundColor(DesignSystem.Colors.title.color)
                    }
                }
                
                Divider()
                    .foregroundColor(DesignSystem.Colors.borderColor.color)
                
                HStack{
                    Text("Total")
                        .font(.custom(AppFont.medium.name, size: Dimensions.d16))
                        .foregroundColor(.black)
                    Spacer()
                    HStack{
                        Text(viewModel.orderDetails?.total ?? "")
                            .font(.custom(AppFont.medium.name, size: Dimensions.d19))
                            .foregroundColor(.black)
                        Text("EG")
                            .font(.custom(AppFont.medium.name, size: Dimensions.d12))
                            .foregroundColor(DesignSystem.Colors.title.color)
                    }
                }
                .padding(.bottom)
            }
            .padding(.horizontal)
        }
        .foregroundColor(.clear)
        .frame(maxWidth: .infinity)
        .cornerRadius(Dimensions.d15)
        .overlay(
            RoundedRectangle(cornerRadius: Dimensions.d15)
                .inset(by: 0.5)
                .stroke(DesignSystem.Colors.borderColor.color, lineWidth: Dimensions.d1)
        )}
    
    var addressTime: some View {
        HStack(alignment: .top, spacing: Dimensions.d16){
            VStack(alignment: .center){
                Image("hat")
                Image("dash")
                Image("markertime")
            }
            .padding(.leading, Dimensions.d10)
            
            VStack(alignment: .leading, spacing: Dimensions.d26){
                VStack(alignment: .leading, spacing: Dimensions.d5){
                    Text("Delivery Order")
                        .font(
                            Font.custom(AppFont.bold.name, size: Dimensions.d15))
                        .foregroundColor(DesignSystem.Colors.main.color)
                    Text(viewModel.orderDetails?.address ?? "")
                        .font(
                            Font.custom(AppFont.bold.name, size: Dimensions.d15))
                        .foregroundColor(DesignSystem.Colors.main.color)
                }
                VStack(alignment: .leading, spacing: Dimensions.d5){
                    Text("Delivery Location")
                        .font(
                            Font.custom(AppFont.bold.name, size: Dimensions.d15))
                        .foregroundColor(DesignSystem.Colors.main.color)
                    Text(viewModel.orderDetails?.address ?? "")
                        .font(Font.custom(AppFont.medium.name, size: Dimensions.d10))
                        .foregroundColor(.black)
                }
            }
            Spacer()
        }
        .foregroundColor(.clear)
        .frame(height: Dimensions.d140)
        .frame(maxWidth: .infinity)
        .cornerRadius(Dimensions.d15)
        .overlay(
            RoundedRectangle(cornerRadius: (viewModel.orderStatus == .delivery) ? Dimensions.d0 : Dimensions.d15)
                .inset(by: 0.5)
                .stroke(DesignSystem.Colors.borderColor.color, lineWidth: (viewModel.orderStatus == .delivery) ? Dimensions.d0 : Dimensions.d1)
        )
    }
}

#Preview {
    OrderDetailsScreen(orderId: 1)
}
