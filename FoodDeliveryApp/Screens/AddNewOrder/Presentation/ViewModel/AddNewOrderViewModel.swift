//
//  AddNewOrderViewModel.swift
//  FoodDeliveryApp
//
//  Created by Mader's Macbook Pro on 21/07/2025.
//  Copyright © 2025 youssef. All rights reserved.
//
import Combine

final class AddNewOrderViewModel: BaseViewModel, ObservableObject {
    @Published var customerName: String = ""
    @Published var vaildCustomerName: Bool = false
    @Published var restaurant: String = ""
    @Published var vaildRestaurant: Bool = false
    @Published var deliveryAddress: String = ""
    @Published var vaildDeliveryAddress: Bool = false
    @Published var selectedItems: [MultipleSelectionRowModel] = []
    @Published var sampleItems: [MultipleSelectionRowModel] = [MultipleSelectionRowModel(title: "pizza", isSelected: false),MultipleSelectionRowModel(title: "burger", isSelected: false),MultipleSelectionRowModel(title: "pepsi", isSelected: false),MultipleSelectionRowModel(title: "cheese", isSelected: false),MultipleSelectionRowModel(title: "passata", isSelected: false),MultipleSelectionRowModel(title: "chicken", isSelected: false),MultipleSelectionRowModel(title: "shawarma", isSelected: false),MultipleSelectionRowModel(title: "meat", isSelected: false)]
    
    private var addOrderUseCase: AddOrdersUseProtocol
    
    init(addOrderUseCase: AddOrdersUseProtocol = AddOrdersUseCase()) {
        self.addOrderUseCase = addOrderUseCase
    }
    
    func addOrder() {
        guard customerName.isValid(type: .required(localizedFieldName: "")) else {
            vaildCustomerName = true
            return
        }
        guard restaurant.isValid(type: .required(localizedFieldName: "")) else {
            vaildRestaurant = true
            return
        }
        guard deliveryAddress.isValid(type: .required(localizedFieldName: "")) else {
            vaildDeliveryAddress = true
            return
        }
        
        let itemSelected = selectedItems.filter({ $0.isSelected }).map({$0.id})
        
        if itemSelected.isEmpty {
            return
        }
        self.state = .loading()
        Task { [weak self] in
            guard let self else { return }
            do {
                let resulte = try await addOrderUseCase.addOrders(addOrdersRequestModel: AddOrdersRequestModel(customerName: customerName, restaurant: restaurant, deliveryAddress: deliveryAddress, itemIds: itemSelected))
                print(resulte)
                state = .successful
            } catch {
                print(error)
                if let networkError = error as? NetworkError {
                    state = .failed(networkError)
                } else {
                    state = .failed(NetworkError.requestFailed(error))
                }
            }
        }
    }
}
