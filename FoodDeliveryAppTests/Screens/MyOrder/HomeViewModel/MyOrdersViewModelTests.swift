//
//  MyOrdersViewModelTests.swift
//  AroundEgyptTests
//
//  Created by Asset's Macbook Pro on 27/06/2025.
//
import XCTest
@testable import FoodDeliveryApp

final class MyOrdersViewModelTests: XCTestCase {
    
    private var sut: MyOrdersViewModel!
    private var initialModel: OrderData!
    override func setUp() {
        initialModel = OrderData(
            id: 1,
            restaurant: "Pizza Palace",
            restaurantImage: "image.png",
            status: .preparing
        )
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        initialModel = nil
        super.tearDown()
    }
    
    func test_GetOrder_Success() async {
        // Arrange
        let mockGetOrdersUseCase = MockGetOrdersUseCase(result: .success([initialModel]))
        
        sut = MyOrdersViewModel(getOrdersUseCase: mockGetOrdersUseCase)
        
        // Act
        sut.getOrders()
        try? await Task.sleep(nanoseconds: 200_000_000) // wait 0.2s
        
        // Assert
        XCTAssertEqual(sut.orders, [initialModel])
    }

    func test_GetOrders_Failure() async {
        // Arrange
        let mockGetOrdersUseCase = MockGetOrdersUseCase(result: .failure(NetworkError.invalidResponse))
        
        sut = MyOrdersViewModel(getOrdersUseCase: mockGetOrdersUseCase)
        // Act + Assert
        sut.getOrders()
        try? await Task.sleep(nanoseconds: 200_000_000)
        XCTAssertEqual(sut.state, .failed(NetworkError.invalidResponse))
    }
}
