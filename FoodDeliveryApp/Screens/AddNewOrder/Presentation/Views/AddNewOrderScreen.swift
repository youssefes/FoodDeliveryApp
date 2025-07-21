//
//  AddNewOrderView.swift
//  FoodDeliveryApp
//
//  Copyright © 2025 youssef. All rights reserved.
//

import SwiftUI

struct AddNewOrderView: View {
    @StateObject private var viewModel: AddNewOrderViewModel = .init()
    
    var body: some View {
        ZStack{
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading,spacing: 16) {
                    Section(header:
                                Text("Customer Information")
                        .font(.custom(AppFont.bold.name, size: 24))
                    ) {
                        InputView(text: $viewModel.customerName, validated: $viewModel.vaildCustomerName, placeholder: "customer Name", validatorType: .required(localizedFieldName: ""))
                        InputView(text: $viewModel.restaurant, validated: $viewModel.vaildRestaurant, placeholder: "restaurant", validatorType: .required(localizedFieldName: ""))
                        InputView(text: $viewModel.deliveryDddress, validated: $viewModel.vaildDeliveryDddress, placeholder: "delivery address", validatorType: .required(localizedFieldName: ""))
                    }
                    
                    Section(header:
                                Text("Select from Menu")
                        .font(.custom(AppFont.bold.name, size: 24))
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
                        
                    })
                }
                .padding()
            }
            
        }
        .background(DesignSystem.Colors.background.color)
    }
}

#Preview {
    AddNewOrderView()
}
