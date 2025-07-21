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
    
    private var updataProfileUseCase: UpdateProfileUseCaseProtocol
    
    init(updataProfileUseCase: UpdateProfileUseCaseProtocol = UpdateProfileUseCase()) {
        self.updataProfileUseCase = updataProfileUseCase
    }
    
    // MARK: - Update Profile request
    func UpdateProfile() {
        guard userName.isValid(type: .required(localizedFieldName: "")) else {
            vaildUserName = true
            return
        }
        self.state = .loading()
        Task { [weak self] in
            guard let self else { return }
            do {
                let user = try await updataProfileUseCase.update(editProfileRequestModel: EditProfileRequestModel(name: userName))
                UserUtilites.saveUser(userDate: user)
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
