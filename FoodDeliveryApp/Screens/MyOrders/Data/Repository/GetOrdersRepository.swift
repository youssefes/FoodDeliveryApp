//
//  GetOrdersRepository.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import Foundation

protocol GetOrdersRepositoryProtocol {
    func fetchOrders() async throws -> [OrderData]
}

class GetOrdersRepository: GetOrdersRepositoryProtocol{
    let ordersLocal: GetOrdersLocalProtocol
    let service: NetworkService
    init(
        service: NetworkService =  NetworkServiceImplementation(),
        ordersLocal: GetOrdersLocalProtocol = GetOrdersLocal()
    ) {
        self.service = service
        self.ordersLocal = ordersLocal
    }
    
    func fetchOrders() async throws -> [OrderData] {
        let cached = try ordersLocal.loadOrders()
        if  !cached.isEmpty {
            Task { try? await fetchAndRefreshIfNeeded(existing: cached) }
            return cached
        } else {
            return try await fetchOrdersRemote()
        }
    }
    
    func fetchOrdersRemote() async throws -> [OrderData] {
        let fetchOrdersEndpoint = Endpoint(path: APIUrls.getOrders)
        do {
            let resulte = try await service.request(fetchOrdersEndpoint, responseType: BaseModel<[OrderData]>.self)
            let orders = resulte.data ?? []
            try ordersLocal.save(orders: orders)
            return orders
        } catch {
            throw error
        }
    }
    
    private func fetchAndRefreshIfNeeded(existing: [OrderData]) async throws {
        let remote = try await fetchOrdersRemote()
        let existing = try ordersLocal.loadOrders()
        guard remote != existing else {
            print("🔁 No data changes detected.")
            return
        }
        try  ordersLocal.save(orders: remote)
    }
}
