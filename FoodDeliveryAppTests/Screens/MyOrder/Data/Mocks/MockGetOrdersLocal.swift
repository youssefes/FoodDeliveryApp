//
//  MockGetOrdersLocal.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import XCTest
@testable import FoodDeliveryApp

class MockGetOrdersLocal: GetOrdersLocalProtocol {
    var cached: [OrderData] = []
    var didSave = false
    var savedExperiences: [OrderData] = []

    func loadOrders() throws -> [OrderData] {
        return cached
    }

    func updateOrder(order: OrderData) throws {
        // not needed for this test
    }

    func save(orders: [OrderData]) throws {
        didSave = true
        savedExperiences = orders
    }
}

