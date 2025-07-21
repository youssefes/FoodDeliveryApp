//
//  SignUpViewModel.swift
//  Created by Asset's Macbook Pro on 21/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import Foundation
import Combine
class SignUpViewModel: BaseViewModel, ObservableObject {
    @Published var phone: String = ""
    @Published var vaildPhone: Bool = false
    @Published var email: String = ""
    @Published var vaildEmail: Bool = false
    @Published var name: String = ""
    @Published var vaildName: Bool = false
    @Published var password: String = ""
    @Published var vaildPassword: Bool = false
    @Published var confirmPassword: String = ""
    @Published var vaildConfirmPassword: Bool = false
    
    @Published var navigate: Bool = false
    
    private var signUpUseCase: SignUpUseCaseProtocol
    init(signUpUseCase: SignUpUseCaseProtocol = SignUpUseCase()) {
        self.signUpUseCase = signUpUseCase
    }
    // MARK: - Sign Up request
    func register() {
        guard phone.isValid(type: .mobileNumber) else {
            vaildPhone = true
            return
        }
        guard name.isValid(type: .required(localizedFieldName: "")) else {
            vaildName = true
            return
        }
        guard email.isValid(type: .email) else {
            vaildEmail = true
            return
        }
        guard password.isValid(type: .required(localizedFieldName: "")) else {
            vaildPassword = true
            return
        }
        self.state = .loading()
      
        Task { [weak self] in
            guard let self else { return }
            do {
                let user = try await signUpUseCase.signUp(signUpRequestModel: SignUpRequestModel(email: email, password: password, confirmPassword: confirmPassword, name: name))
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
