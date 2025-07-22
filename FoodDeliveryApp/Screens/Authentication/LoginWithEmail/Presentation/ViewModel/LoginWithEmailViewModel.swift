//
//  LoginWithEmailViewModel.swift
//  Created by Asset's Macbook Pro on 20/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import Combine
import Foundation
class LoginWithEmailViewModel: BaseViewModel, ObservableObject {
    @Published var email: String = ""
    @Published var vaildEmail: Bool = false
    @Published var password: String = ""
    @Published var vaildPassword: Bool = false
    @Published var navigate: Bool = false
    private var loginUseCase: LoginUseCaseProtocol
    init(loginUseCase: LoginUseCaseProtocol = LoginUseCase()) {
        self.loginUseCase = loginUseCase
    }
    // MARK: - login request
    func login() {
        guard email.isValid(type: .email) else {
            vaildEmail = true
            return
        }
        
        guard password.isValid(type: .password) else {
            vaildPassword = true
            return
        }
        
        self.state = .loading()
        Task { @MainActor [weak self] in
            guard let self else { return }
            do {
                let user = try await loginUseCase.login(loginRequestModel: LoginRequestModel(email: email, password: password))
                UserUtilites.saveUser(userDate: user)
                navigate = true
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
}
