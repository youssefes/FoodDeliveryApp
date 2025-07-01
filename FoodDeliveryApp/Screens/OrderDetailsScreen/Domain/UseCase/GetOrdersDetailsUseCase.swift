//
//  GetOrdersDetailsUseCase.swift
//  FoodDeliveryApp
//
//  Created by Asset's Macbook Pro on 01/07/2025.
//

import Foundation
import Combine

protocol GetOrdersDetailsUseCaseProtocol {
    func getOrderDetails(orderId: Int) async throws -> OrderDetailsData
}

class GetOrdersDetailsUseCase: GetOrdersDetailsUseCaseProtocol {
    
    var repository: GetOrdersDetailsRepositoryProtocol
    init(repository: GetOrdersDetailsRepositoryProtocol = GetOrdersDetailsRepository()) {
        self.repository = repository
    }
    
    func getOrderDetails(orderId: Int) async throws -> OrderDetailsData {
        return try await repository.getOrdersDetails(orderId: orderId)
    }
    
}

