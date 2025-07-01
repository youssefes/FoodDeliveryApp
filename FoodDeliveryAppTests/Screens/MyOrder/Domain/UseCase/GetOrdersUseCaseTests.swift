//
//  GetOrdersUseCaseTests.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import XCTest
@testable import FoodDeliveryApp

final class GetOrdersUseCaseTests: XCTestCase {
    
    private var sut: GetOrdersUseCase!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testGetOrders_Success() async throws {
        // Arrange
        let expectedModel = [OrderData(
            id: 1,
            restaurant: "Pizza Palace",
            restaurantImage: "image.png",
            status: .preparing
        )]
        let mockRepo = MockGetOrdersRepository(resultToReturn: .success(expectedModel))
        sut = GetOrdersUseCase(repository: mockRepo)

        // Act
        let result = try await sut.getOrders()

        // Assert
        XCTAssertEqual(result, expectedModel)
    }

    func testGetOrders_Failure() async {
        // Arrange
        let mockRepo = MockGetOrdersRepository(resultToReturn: .failure(NetworkError.invalidResponse))
        sut = GetOrdersUseCase(repository: mockRepo)

        // Act & Assert
        do {
            _ = try await sut.getOrders()
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertTrue(error is NetworkError)
        }
    }
}
