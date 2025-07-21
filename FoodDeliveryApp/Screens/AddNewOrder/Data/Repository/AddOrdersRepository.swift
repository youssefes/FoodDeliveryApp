//
//  AddOrdersRepository.swift
//  FoodDeliveryApp
//
//  Created by Asset's Macbook Pro on 01/07/2025.
//

import Foundation
struct AddOrdersRequestModel: Codable {
    var customerName: String
    var restaurant: String
    var deliveryAddress: String
    var itemIds: [String]
}
protocol AddOrdersRepositoryProtocol {
    func addOrders(addOrdersRequestModel:AddOrdersRequestModel) async throws -> String
}

class AddOrdersRepository: AddOrdersRepositoryProtocol {
    
    let service: NetworkService
    init(
        service: NetworkService =  NetworkServiceImplementation()
    ) {
        self.service = service
    }
    
    func addOrders(addOrdersRequestModel:AddOrdersRequestModel) async throws -> String {
        let fetchOrdersEndpoint = Endpoint(path: APIUrls.getOrders,method: .POST,body: addOrdersRequestModel)
        do {
            let resulte = try await service.request(fetchOrdersEndpoint, responseType: BaseModel<String>.self)
            guard let order = resulte.data else {throw NetworkError.invalidResponse}
            return order
        } catch {
            throw error
        }
    }
}
