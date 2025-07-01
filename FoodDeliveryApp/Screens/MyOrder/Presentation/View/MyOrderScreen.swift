//
//  MyOrderScreen.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI

struct MyOrderScreen: View {
    @StateObject var viewModel = MyOrderViewModel()
    var body: some View {
        BaseView(state: $viewModel.state) {
            VStack{
                ScrollView{
                    LazyVStack(spacing: 20){
                        ForEach($viewModel.orders,id:\.id) { order in
                            OrderView(viewModel: viewModel, order: order, trackAction: { orderId in
                                print("Tarcking \(orderId)")
                            })
                        }
                    }
                    .padding(.vertical,4)
                }
            }
            .task {
                viewModel.getOrders()
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .background(DesignSystem.Colors.background.color)
    }
}

#Preview {
    MyOrderScreen()
}
