//
//  AddOrdersUseCase.swift
//  FoodDeliveryApp
//
//  Created by Asset's Macbook Pro on 01/07/2025.
//

import Foundation
import Combine

protocol AddOrdersUseProtocol {
    func addOrders(addOrdersRequestModel:AddOrdersRequestModel) async throws -> String
}

class AddOrdersUseCase: AddOrdersUseProtocol {
    
    var repository: AddOrdersRepositoryProtocol
    init(repository: AddOrdersRepositoryProtocol = AddOrdersRepository()) {
        self.repository = repository
    }
    
    func addOrders(addOrdersRequestModel:AddOrdersRequestModel) async throws -> String {
        return try await repository.addOrders(addOrdersRequestModel:addOrdersRequestModel)
    }
    
}

