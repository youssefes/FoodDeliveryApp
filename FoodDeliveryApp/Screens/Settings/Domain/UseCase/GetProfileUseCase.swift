//
//  GetProfileUseCase.swift
//  FoodDeliveryApp
//
//  Created by Mader's Macbook Pro on 22/07/2025.
//


import Combine

protocol GetProfileUseCaseProtocol {
    func getProfile() async throws -> User
}

class GetProfileUseCase: GetProfileUseCaseProtocol {
    
    var repository: GetProfileRepositoryProtocol
    init(repository: GetProfileRepositoryProtocol = GetProfileRepository()) {
        self.repository = repository
    }
    
    func getProfile() async throws -> User {
        return try await repository.getProfile()
    }
    
}
