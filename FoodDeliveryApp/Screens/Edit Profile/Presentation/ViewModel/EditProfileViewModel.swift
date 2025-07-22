//
//  MyProfileViewModel.swift
//  GO
//
//  Created by Ahmed Eltrass on 01/03/2024.
//

import Foundation
import Combine
import UIKit
class EditProfileViewModel: BaseViewModel, ObservableObject {
    @Published var userName: String = ""
    @Published var vaildUserName: Bool = false
    @Published var email: String =   ""
    @Published var vaildEmail: Bool = false
    
    @Published var resulteMassage: String = "Profile Update Successful"
    @Published var showUpdateScucess: Bool = false
    
    
    private var updataProfileUseCase: UpdateProfileUseCaseProtocol
    private var getProfileUseCase: GetProfileUseCaseProtocol
    init(updataProfileUseCase: UpdateProfileUseCaseProtocol = UpdateProfileUseCase(),getProfileUseCase: GetProfileUseCaseProtocol = GetProfileUseCase()) {
        self.updataProfileUseCase = updataProfileUseCase
        self.getProfileUseCase = getProfileUseCase
    }
    // MARK: - get Profile request
    func getProfile() {
        Task { @MainActor [weak self] in
            guard let self else {return}
            do {
                let user = try await getProfileUseCase.getProfile()
                UserUtilites.saveUser(userDate: user)
                email = user.email
                userName = user.username
                state = .successful
            } catch {
                if let networkError = error as? NetworkError {
                    state = .failed(networkError)
                } else {
                    state = .failed(NetworkError.requestFailed(error))
                }
            }
        }
    }
    
    // MARK: - Update Profile request
    func UpdateProfile() {
        guard userName.isValid(type: .required(localizedFieldName: "")) else {
            vaildUserName = true
            return
        }
        self.state = .loading()
        Task { @MainActor [weak self] in
            guard let self else { return }
            do {
                let user = try await updataProfileUseCase.update(editProfileRequestModel: EditProfileRequestModel(name: userName))
                UserUtilites.saveUser(userDate: user)
                showUpdateScucess = true
                state = .successful
            } catch {
                print(error)
                if let networkError = error as? NetworkError {
                    state = .failed(networkError)
                } else {
                    state = .failed(NetworkError.requestFailed(error))
                }
            }
        }
    }
}
