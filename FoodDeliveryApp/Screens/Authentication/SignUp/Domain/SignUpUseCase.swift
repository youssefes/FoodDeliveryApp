//
//  SignUpUseCase.swift
//  FoodDeliveryApp
//
//  Created by Mader's Macbook Pro on 22/07/2025.
//


import Combine

protocol SignUpUseCaseProtocol {
    func signUp(signUpRequestModel: SignUpRequestModel) async throws -> User
}

class SignUpUseCase: SignUpUseCaseProtocol {
    
    var repository: SignUpRepositoryProtocol
    init(repository: SignUpRepositoryProtocol = SignUpRepository()) {
        self.repository = repository
    }
    
    func signUp(signUpRequestModel: SignUpRequestModel) async throws -> User {
        return try await repository.signUp(signUpRequestModel: signUpRequestModel)
    }
    
}
