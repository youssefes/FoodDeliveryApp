//
//  SignUpRepository.swift
//  FoodDeliveryApp
//
//  Created by Mader's Macbook Pro on 21/07/2025.
//

import Foundation

struct SignUpRequestModel: Encodable {
    let email: String
    let password: String
    let confirmPassword: String
    let name: String
}

protocol SignUpRepositoryProtocol {
    func signUp(signUpRequestModel: SignUpRequestModel) async throws ->  User
}

class SignUpRepository: SignUpRepositoryProtocol{
    let service: NetworkService
    init(
        service: NetworkService =  NetworkServiceImplementation()
    ) {
        self.service = service
    }
    
    func signUp(signUpRequestModel: SignUpRequestModel) async throws -> User  {
        let signUpEndpoint = Endpoint(path: APIUrls.register,method: .POST,body: signUpRequestModel)
        do {
            let resulte = try await service.request(signUpEndpoint, responseType: BaseModel<User>.self)
            guard let user = resulte.data else {throw NetworkError.invalidResponse}
            return user
        } catch {
            throw error
        }
    }
}
