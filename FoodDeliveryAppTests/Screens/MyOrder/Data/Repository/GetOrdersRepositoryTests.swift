//
//  GetOrdersRepositoryTests.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import XCTest
@testable import FoodDeliveryApp

// MARK: - Tests
final class GetOrdersRepositoryTests: XCTestCase {
    
    private var sut: GetOrdersRepository!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testFetchOrders_ReturnsCached_WhenExists() async throws {
        // Arrange
        let cachedOrder = OrderData(
            id: 1,
            restaurant: "Pizza Palace",
            restaurantImage: "image.png",
            status: .preparing
        )
        let mockLocal = MockGetOrdersLocal()
        mockLocal.cached = [cachedOrder]
        
        
        let expectedValue = BaseModel<[OrderData]>(success: true, data: [OrderData(
            id: 1,
            restaurant: "Pizza Palace",
            restaurantImage: "image.png",
            status: .preparing
        )])
        
        let mockService = MockGetOrdersNetworkService(shouldSucceed: true, returnedValue: expectedValue, thrownError: nil)
        
        let repository = GetOrdersRepository(service: mockService, ordersLocal: mockLocal)
        
        // Act
        let result = try await repository.fetchOrders()
        
        // Assert
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.id, cachedOrder.id)
    }
    
    func testFetchOrders_ReturnsRemote_WhenCacheEmpty() async throws {
        // Arrange
        let remoteOrder = OrderData(
            id: 1,
            restaurant: "Pizza Palace",
            restaurantImage: "image.png",
            status: .preparing
        )
        
        let mockLocal = MockGetOrdersLocal()
        mockLocal.cached = []
        
        let expectedValue = BaseModel<[OrderData]>(success: true, data: [OrderData(
            id: 1,
            restaurant: "Pizza Palace",
            restaurantImage: "image.png",
            status: .preparing
        )])
        
        let mockService = MockGetOrdersNetworkService(shouldSucceed: true, returnedValue: expectedValue, thrownError: nil)
        
        let repository = GetOrdersRepository(service: mockService, ordersLocal: mockLocal)
        
        // Act
        let result = try await repository.fetchOrders()
        
        // Assert
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.id, remoteOrder.id)
        XCTAssertTrue(mockLocal.didSave)
        XCTAssertEqual(mockLocal.savedExperiences.first?.id, remoteOrder.id)
    }
    
    func testFetchOrdersRemote_ThrowsOnNetworkError() async {
        // Arrange
        let mockLocal = MockGetOrdersLocal()
        let expectedValue = BaseModel<[OrderData]>(success: false, data: nil)
        
        let mockService = MockGetOrdersNetworkService(shouldSucceed: false, returnedValue: expectedValue, thrownError: NetworkError.invalidURL)
        
        let repository = GetOrdersRepository(service: mockService, ordersLocal: mockLocal)
        
        // Act + Assert
        do {
            _ = try await repository.fetchOrders()
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertTrue(error is NetworkError)
        }
    }
}
