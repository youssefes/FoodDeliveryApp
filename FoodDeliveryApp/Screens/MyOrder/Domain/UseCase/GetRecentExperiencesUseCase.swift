//
//  GetRecentExperiencesUseCase.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.
//

import Foundation
import Combine

protocol GetOrdersUseCaseProtocol {
    func getOrders() async throws -> [OrderData]
}

class GetOrdersUseCase: GetOrdersUseCaseProtocol {
    
    var repository: GetOrdersRepositoryProtocol
    init(repository: GetOrdersRepositoryProtocol = GetOrdersRepository ()) {
        self.repository = repository
    }
    
    func getOrders() async throws -> [OrderData] {
        return try await repository.fetchOrders()
    }
    
}
