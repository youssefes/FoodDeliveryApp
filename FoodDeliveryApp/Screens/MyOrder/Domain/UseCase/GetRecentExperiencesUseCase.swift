//
//  GetRecentExperiencesUseCase.swift
//  AroundEgypt
//
//  Created by Asset's Macbook Pro on 25/06/2025.
//

import Foundation
import Combine

protocol GetOrdersUseCaseProtocol {
    func GetOrders() async throws -> [OrderData]
}

class GetOrdersUseCase: GetOrdersUseCaseProtocol {
    
    var repository: GetOrdersRepositoryProtocol
    init(repository: GetOrdersRepositoryProtocol = GetOrdersRepository ()) {
        self.repository = repository
    }
    
    func GetOrders() async throws -> [OrderData] {
        return try await repository.fetchOrders()
    }
    
}
