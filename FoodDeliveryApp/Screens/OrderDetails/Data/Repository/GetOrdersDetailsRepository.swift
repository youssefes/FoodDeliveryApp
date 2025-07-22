//
//  GetOrdersDetailsRepository.swift
//  FoodDeliveryApp
//
//  Created by Asset's Macbook Pro on 01/07/2025.
//

import Foundation

protocol GetOrdersDetailsRepositoryProtocol {
    func getOrdersDetails(orderId: Int) async throws -> OrderDetailsData
}

class GetOrdersDetailsRepository: GetOrdersDetailsRepositoryProtocol {
    
    let service: NetworkService
    init(
        service: NetworkService =  NetworkServiceImplementation()
    ) {
        self.service = service
    }
    
    func getOrdersDetails(orderId: Int) async throws -> OrderDetailsData {
        let fetchOrdersEndpoint = Endpoint(path: APIUrls.getOrder,queryItems: [URLQueryItem(name: "Id", value: "\(orderId)")])
        do {
            let resulte = try await service.request(fetchOrdersEndpoint, responseType: BaseModel<OrderDetailsData>.self)
            guard let order = resulte.data else {throw NetworkError.invalidResponse}
            return order
        } catch {
            throw error
        }
    }
}
