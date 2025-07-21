//
//  SignUpViewModel.swift
//  Created by Asset's Macbook Pro on 21/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import Foundation
import Combine
class SignUpViewModel: ObservableObject {
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
    @Published var loaging: Bool = false
    @Published var error: String = ""
    @Published var hasError: Bool = false
    private var subs = Set<AnyCancellable>()
    
    // MARK: - login request
    func register() {
//        guard phone.isValid(type: .mobileNumber) else {
//            vaildPhone = true
//            return
//        }
//        guard name.isValid(type: .required(localizedFieldName: "")) else {
//            vaildName = true
//            return
//        }
//        guard email.isValid(type: .email) else {
//            vaildEmail = true
//            return
//        }
//        guard password.isValid(type: .required(localizedFieldName: "")) else {
//            vaildPassword = true
//            return
//        }
//        let registerRquestModel = RegisterRquestModel(email: email, username: name, deviceType: "ios", mobile: "\(phone)", password: password, fcmToken: "notReisterToNotification")
//        useCase = RegisterUseCase(registerRquestModel: registerRquestModel)
//        useCase?.willProcess = { [weak self] in
//            guard let self = self else {return}
//            self.loaging = true
//            self.navigate = false
//            self.error = ""
//            self.hasError = false
//        }
//        useCase?.execute(BaseModel<Double>.self).sink { [weak self] complition in
//            guard let self = self  else {return}
//            DispatchQueue.main.async {
//                self.loaging = false
//                switch complition {
//                case .finished:
//                   print("finish")
//                case .failure(let error):
//                    self.error = error.message.localized
//                    self.hasError = true
//                }
//            }
//        } receiveValue: {[weak self]  resulte in
//            guard let self = self else {return}
//            DispatchQueue.main.async {
//                if resulte.success {
//                    print(resulte)
//                    self.navigate = true
//                } else {
//                    self.error = resulte.message ?? ""
//                    self.hasError = true
//                }
//            }
//        }.store(in: &subs)
    }
}
