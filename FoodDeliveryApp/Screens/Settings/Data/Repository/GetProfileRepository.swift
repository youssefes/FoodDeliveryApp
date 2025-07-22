//
//  GetProfileRepository.swift
//  FoodDeliveryApp
//
//  Created by Mader's Macbook Pro on 21/07/2025.
//

import Foundation

protocol GetProfileRepositoryProtocol {
    func getProfile() async throws ->  User
}

class GetProfileRepository: GetProfileRepositoryProtocol{
    let service: NetworkService
    init(
        service: NetworkService =  NetworkServiceImplementation()
    ) {
        self.service = service
    }
    
    func getProfile() async throws -> User  {
        let loginEndpoint = Endpoint(path: APIUrls.getProfile)
        do {
            let resulte = try await service.request(loginEndpoint, responseType: BaseModel<User>.self)
            guard let user = resulte.data else {throw NetworkError.invalidResponse}
            return user
        } catch {
            throw error
        }
    }
}
