//
//  MockGetOrdersUseCase.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import XCTest
@testable import FoodDeliveryApp

class MockGetOrdersUseCase: GetOrdersUseCaseProtocol {
    var result: Result<[OrderData], Error>
    
    init(result: Result<[OrderData], Error>) {
        self.result = result
    }
    
    func getOrders() async throws -> [OrderData] {
        switch result {
        case .success(let model): return model
        case .failure(let error): throw error
        }
    }
}
