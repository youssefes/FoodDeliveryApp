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
            VStack{
                HStack {
                    SearchBarView(text: $viewModel.searchKey)
                    filterView
                }
                .padding(Dimensions.d10)
                
                listOfOrders
                    .padding(.vertical, Dimensions.d4)
                
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        coordinator.pop()
                    }) {
                        HStack(spacing: Dimensions.d20){
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black) // arrow color
                            Text("Orders")
                                .font(.custom(AppFont.bold.name, size: Dimensions.d24))
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
    
    var filterView: some View {
        HStack {
            // Status filter button
            Button(action: { viewModel.showStatusFilter = true }) {
                HStack {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                    Text(viewModel.selectedStatus.rawValue)
                }
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            }
        }
        .sheet(isPresented: $viewModel.showStatusFilter) {
            StatusFilterView(selectedStatus: $viewModel.selectedStatus, isPresented: $viewModel.showStatusFilter)
        }
    }
    
    var listOfOrders: some View {
        List {
            ForEach(viewModel.filteredOrders,id:\.id) { order in
                OrderView(viewModel: viewModel, order: order, trackAction: { orderId in
                    coordinator.navigate(to: .orderDetails(id: orderId))
                })
                .contentShape(Rectangle())
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                .padding(.vertical, Dimensions.d10)
                .onTapGesture {
                    coordinator.navigate(to: .orderDetails(id: order.id))
                }
            }
        }
        .listStyle(.plain)
        .background(Color.clear)
        .scrollContentBackground(.hidden)
        .refreshable {
            viewModel.getOrders()
        }
    }
}

#Preview {
    MyOrdersScreen()
}


struct StatusFilterView: View {
    @Binding var selectedStatus: orderStatus
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            List(orderStatus.allCases,id: \.self) { status in
                Button(action: {
                    selectedStatus = status
                    isPresented = false
                }) {
                    HStack {
                        Text(status.rawValue)
                        Spacer()
                        if selectedStatus == status {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .foregroundColor(.primary)
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Filter by Status")
            .navigationBarItems(trailing: Button("Done") {
                isPresented = false
            })
        }
    }
}
