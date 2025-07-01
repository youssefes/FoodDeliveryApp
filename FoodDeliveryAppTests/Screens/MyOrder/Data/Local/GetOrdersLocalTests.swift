//
//  GetOrdersLocalTests.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.


import XCTest
@testable import FoodDeliveryApp
import CoreData


final class GetOrdersLocalTests: XCTestCase {

    var sut: GetOrdersLocal!

    override func setUpWithError() throws {
        sut = GetOrdersLocal()

        // Replace persistent store with in-memory
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        sut.container.persistentStoreDescriptions = [description]

        var loadError: Error?
        let exp = expectation(description: "load store")
        sut.container.loadPersistentStores { _, error in
            loadError = error
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        if let error = loadError {
            throw error
        }
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testSaveAndLoadOrder() throws {
        // Arrange
        let order = OrderData(
            id: 1,
            restaurant: "Pizza Palace",
            restaurantImage: "image.png",
            status: .preparing
        )

        // Act
        try sut.save(orders: [order])
        let loaded = try sut.loadOrders()

        // Assert
        XCTAssertEqual(loaded.first?.id, order.id)
    }

    func testUpdateOrder() throws {
        // Arrange
        let order = OrderData(
            id: 1,
            restaurant: "Pizza Palace",
            restaurantImage: "image.png",
            status: .preparing
        )
        try sut.save(orders: [order])

        let updated = OrderData(
            id: 1,
            restaurant: "Pizza Palace",
            restaurantImage: "image.png",
            status: .delivery
        )

        // Act
        try sut.updateOrder(order: updated)
        let loaded = try sut.loadOrders()

        // Assert
        XCTAssertEqual(loaded.first?.status, updated.status)
    }
}
