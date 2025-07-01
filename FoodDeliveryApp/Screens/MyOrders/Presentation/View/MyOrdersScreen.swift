//
//  MyOrdersScreen.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI

struct MyOrdersScreen: View {
    @StateObject var viewModel = MyOrdersViewModel()
    var body: some View {
        NavigationStack {
            BaseView(state: $viewModel.state) {
                ScrollView(showsIndicators: false) {
                    listOfOrders
                        .navigationDestination(for: OrderData.self) { order in
                            OrderDetailsScreen(orderId: order.id)
                        }
                        .padding(.vertical,4)
                }
                .navigationTitle("Orders")
                .task {
                    viewModel.getOrders()
                }
            }
        }
    }
    
    var listOfOrders: some View {
        LazyVStack(spacing: 20){
            ForEach(viewModel.orders,id:\.id) { order in
                NavigationLink(value: order) {
                    OrderView(viewModel: viewModel, order: order, trackAction: { orderId in
                        print("Tarcking \(orderId)")
                    })
                }
            }
        }
    }
}

#Preview {
    MyOrdersScreen()
}
