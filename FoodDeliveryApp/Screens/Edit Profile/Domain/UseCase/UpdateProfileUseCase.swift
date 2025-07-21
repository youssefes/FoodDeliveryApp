//
//  SignUpUseCase.swift
//  FoodDeliveryApp
//
//  Created by Mader's Macbook Pro on 22/07/2025.
//


import Combine

protocol UpdateProfileUseCaseProtocol {
    func update(editProfileRequestModel: EditProfileRequestModel) async throws -> User
}

class UpdateProfileUseCase: UpdateProfileUseCaseProtocol {
    
    var repository: UpdateProfileRepositoryProtocol
    init(repository: UpdateProfileRepositoryProtocol = UpdateProfileRepository()) {
        self.repository = repository
    }
    
    func update(editProfileRequestModel: EditProfileRequestModel) async throws -> User {
        return try await repository.update(editProfileRequestModel: editProfileRequestModel)
    }
    
}
