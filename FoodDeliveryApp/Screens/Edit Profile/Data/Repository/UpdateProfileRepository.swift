//
//  UpdateProfileRepository.swift
//  FoodDeliveryApp
//
//  Created by Mader's Macbook Pro on 21/07/2025.
//

import Foundation
struct EditProfileRequestModel: Encodable {
    var name: String
}

protocol UpdateProfileRepositoryProtocol {
    func update(editProfileRequestModel: EditProfileRequestModel) async throws ->  User
}

class UpdateProfileRepository: UpdateProfileRepositoryProtocol{
    let service: NetworkService
    init(
        service: NetworkService =  NetworkServiceImplementation()
    ) {
        self.service = service
    }
    
    func update(editProfileRequestModel: EditProfileRequestModel) async throws -> User  {
        let loginEndpoint = Endpoint(path: APIUrls.getProfile,method: .PUT,body: editProfileRequestModel)
        do {
            let resulte = try await service.request(loginEndpoint, responseType: BaseModel<User>.self)
            guard let user = resulte.data else {throw NetworkError.invalidResponse}
            return user
        } catch {
            throw error
        }
    }
}
