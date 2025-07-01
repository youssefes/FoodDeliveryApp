//
//  MockGetOrdersNetworkService.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import XCTest
@testable import FoodDeliveryApp

// MARK: - Mock NetworkService 
class MockGetOrdersNetworkService: NetworkService {
    var shouldSucceed: Bool
    var returnedValue: BaseModel<[OrderData]>
    var thrownError: Error?

    init(shouldSucceed: Bool, returnedValue: BaseModel<[OrderData]>, thrownError: Error?) {
        self.shouldSucceed = shouldSucceed
        self.returnedValue = returnedValue
        self.thrownError = thrownError
    }

    func request<T>(_ endpoint: Endpoint, responseType: T.Type) async throws -> T where T: Decodable {
        if shouldSucceed {
            if let result = returnedValue as? T {
                return result
            } else {
                throw NetworkError.invalidResponse  // 🛑 this is your actual error
            }
        } else if let error = thrownError {
            throw error
        } else {
            throw NetworkError.invalidURL
        }
    }
}
