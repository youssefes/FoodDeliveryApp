//
//  AddNewOrderViewModel.swift
//  FoodDeliveryApp
//
//  Created by Mader's Macbook Pro on 21/07/2025.
//  Copyright © 2025 youssef. All rights reserved.
//
import Combine

final class AddNewOrderViewModel: ObservableObject {
    @Published var customerName: String = ""
    @Published var vaildCustomerName: Bool = false
    @Published var restaurant: String = ""
    @Published var vaildRestaurant: Bool = false
    @Published var deliveryDddress: String = ""
    @Published var vaildDeliveryDddress: Bool = false
    @Published var selectedItems: [MultipleSelectionRowModel] = []
    @Published var sampleItems: [MultipleSelectionRowModel] = [MultipleSelectionRowModel(title: "pizza", isSelected: false),MultipleSelectionRowModel(title: "burger", isSelected: false),MultipleSelectionRowModel(title: "pepsi", isSelected: false),MultipleSelectionRowModel(title: "cheese", isSelected: false),MultipleSelectionRowModel(title: "passata", isSelected: false),MultipleSelectionRowModel(title: "chicken", isSelected: false),MultipleSelectionRowModel(title: "shawarma", isSelected: false),MultipleSelectionRowModel(title: "meat", isSelected: false)]
}
