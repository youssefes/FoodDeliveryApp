//
//  LoginRepository.swift
//  FoodDeliveryApp
//
//  Created by Mader's Macbook Pro on 21/07/2025.
//

import Foundation

struct LoginRequestModel: Encodable {
    let email: String
    let password: String
}

protocol LoginRepositoryProtocol {
    func login(loginRequestModel: LoginRequestModel) async throws ->  User
}

class LoginRepository: LoginRepositoryProtocol{
    let service: NetworkService
    init(
        service: NetworkService =  NetworkServiceImplementation()
    ) {
        self.service = service
    }
    
    func login(loginRequestModel: LoginRequestModel) async throws -> User  {
        let loginEndpoint = Endpoint(path: APIUrls.login,method: .POST,body: loginRequestModel)
        do {
            let resulte = try await service.request(loginEndpoint, responseType: BaseModel<User>.self)
            guard let user = resulte.data else {throw NetworkError.invalidResponse}
            return user
        } catch {
            throw error
        }
    }
}
