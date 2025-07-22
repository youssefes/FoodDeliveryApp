//
//  AddNewOrderView.swift
//  FoodDeliveryApp
//
//  Copyright © 2025 youssef. All rights reserved.
//

import SwiftUI

struct AddNewOrderView: View {
    @StateObject private var viewModel: AddNewOrderViewModel = .init()
    @EnvironmentObject var coordinator: AppCoordinator
    var body: some View {
        BaseView(state: $viewModel.state) {
            ZStack{
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading,spacing: Dimensions.d16) {
                        Section(header:
                                    Text("Customer Information")
                            .font(.custom(AppFont.medium.name, size: Dimensions.d20))
                        ) {
                            InputView(text: $viewModel.customerName, validated: $viewModel.vaildCustomerName, placeholder: "customer Name", validatorType: .required(localizedFieldName: ""))
                            InputView(text: $viewModel.restaurant, validated: $viewModel.vaildRestaurant, placeholder: "restaurant", validatorType: .required(localizedFieldName: ""))
                            InputView(text: $viewModel.deliveryAddress, validated: $viewModel.vaildDeliveryAddress, placeholder: "delivery address", validatorType: .required(localizedFieldName: ""))
                        }
                        
                        Section(header:
                                    Text("Select from Menu")
                            .font(.custom(AppFont.medium.name, size: Dimensions.d20))
                        ) {
                            ForEach($viewModel.sampleItems, id: \.id) { item in
                                MultipleSelectionRow(Model: item.wrappedValue,action: {
                                    guard let index = viewModel.sampleItems.firstIndex(of: item.wrappedValue) else { return }
                                    viewModel.sampleItems[index].isSelected.toggle()
                                })
                            }
                        }
                        Spacer()
                        
                        MainButton(title: "Add Order", clicked: {
                            viewModel.addOrder()
                        })
                    }
                    .padding()
                }
                
            }
            .alert("Success", isPresented: $viewModel.showAddScucess, actions: {
                Button("OK", role: .cancel) {
                    coordinator.pop()
                }
            }, message: {
                Text(viewModel.resulteMassage)
            })
            .background(DesignSystem.Colors.background.color)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        coordinator.pop()
                    }) {
                        HStack(spacing: Dimensions.d20){
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black) // arrow color
                            Text("Add Order")
                                .font(.custom(AppFont.bold.name, size: Dimensions.d24))
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AddNewOrderView()
}
