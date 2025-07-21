//
//  LoginUseCase.swift
//  FoodDeliveryApp
//
//  Created by Mader's Macbook Pro on 22/07/2025.
//


import Combine

protocol LoginUseCaseProtocol {
    func login(loginRequestModel: LoginRequestModel) async throws -> User
}

class LoginUseCase: LoginUseCaseProtocol {
    
    var repository: LoginRepositoryProtocol
    init(repository: LoginRepositoryProtocol = LoginRepository()) {
        self.repository = repository
    }
    
    func login(loginRequestModel: LoginRequestModel) async throws -> User {
        return try await repository.login(loginRequestModel: loginRequestModel)
    }
    
}
