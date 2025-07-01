//
//  GetOrdersRepositoryTests.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import XCTest
@testable import FoodDeliveryApp

class MockGetOrdersRepository: GetOrdersRepositoryProtocol {
    var resultToReturn: Result<[OrderData], Error>
    
    init(resultToReturn: Result<[OrderData], Error>) {
        self.resultToReturn = resultToReturn
    }
    
    func fetchOrders() async throws -> [OrderData] {
        switch resultToReturn {
        case .success(let model): return model
        case .failure(let error): throw error
        }
    }
}
