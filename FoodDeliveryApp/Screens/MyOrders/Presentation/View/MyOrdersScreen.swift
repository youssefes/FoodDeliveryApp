//
//  MyOrdersScreen.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI

struct MyOrdersScreen: View {
    @StateObject var viewModel = MyOrdersViewModel()
    @EnvironmentObject var coordinator: AppCoordinator
    var body: some View {
        BaseView(state: $viewModel.state) {
            ScrollView(showsIndicators: false) {
                listOfOrders
                    .padding(.vertical,4)
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
                            Text("Orders")
                                .font(.custom(AppFont.bold.name, size: 24))
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
            .task {
                viewModel.getOrders()
            }
        }
    }
    
    var listOfOrders: some View {
        LazyVStack(spacing: 20){
            ForEach(viewModel.orders,id:\.id) { order in
                OrderView(viewModel: viewModel, order: order, trackAction: { orderId in
                    coordinator.navigate(to: .orderDetails(id: orderId))
                })
                .onTapGesture {
                    coordinator.navigate(to: .orderDetails(id: order.id))
                }
            }
        }
    }
}

#Preview {
    MyOrdersScreen()
}
