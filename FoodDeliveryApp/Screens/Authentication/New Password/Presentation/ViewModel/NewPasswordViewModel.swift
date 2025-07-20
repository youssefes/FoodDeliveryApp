//
//  NewPasswordViewModel.swift
//  GO
//
//  Created by POMAC-IOS on 04/03/2024.
//

import Foundation
import Combine
class NewPasswordViewModel: ObservableObject {
    @Published var password: String = ""
    @Published var vaildpassword: Bool = false
    @Published var confirmPassword: String = ""
    @Published var vaildconfirmPassword: Bool = false
    @Published var changePasswordDone: Bool = false
    private var subs = Set<AnyCancellable>()
//    private var useCase: NewPasswordUseCase?
    @Published var loaging: Bool = false
    @Published var error: String = ""
    @Published var hasError: Bool = false
    // MARK: - login request
    func newPassword(phone: String) {
//        guard password.isValid(type: .password) else {
//            vaildpassword = true
//            return
//        }
//        guard confirmPassword.isValid(type: .confirmPassword(password: password)) else {
//            vaildconfirmPassword = true
//            return
//        }
//        useCase = NewPasswordUseCase(phone: phone, password: password)
//        useCase?.willProcess = { [weak self] in
//            guard let self = self else {return}
//            self.loaging = true
//            self.changePasswordDone = false
//        }
//        useCase?.execute(BaseModel<LoginData>.self).sink { [weak self] complition in
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
//            print(resulte)
//            DispatchQueue.main.async {
//                if resulte.success {
//                    self.changePasswordDone = true
//                } else {
//                    self.error = resulte.message ?? ""
//                    self.hasError = true
//                }
//            }
//        }.store(in: &subs)
    }
}
