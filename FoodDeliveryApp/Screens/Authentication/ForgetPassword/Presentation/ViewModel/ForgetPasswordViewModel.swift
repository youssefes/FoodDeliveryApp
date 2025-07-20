//
//  ForgetPasswordViewModel.swift
//  GO
//
//  Created by POMAC-IOS on 04/03/2024.
//

import Foundation
import Combine
class ForgetPasswordViewModel : ObservableObject {
    @Published var email: String = ""
    @Published var vaildEmail: Bool = false
    @Published var navigate: Bool = false
    private var subs = Set<AnyCancellable>()
//    private var useCase: LoginWithPhoneUseCase?
    @Published var loaging: Bool = false
    @Published var error: String = ""
    @Published var hasError: Bool = false
    // MARK: - login request
    func forgetPassword() {
        self.navigate = true
//        guard email.isValid(type: .email) else {
//            vaildEmail = true
//            return
//        }
//        useCase = LoginWithPhoneUseCase(phone: "\(phone)")
//        useCase?.willProcess = { [weak self] in
//            guard let self = self else {return}
//            self.loaging = true
//            self.navigate = false
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
//            print(resulte)
//            DispatchQueue.main.async {
//                if resulte.success {
//                    self.navigate = true
//                } else {
//                    self.error = resulte.message ?? ""
//                    self.hasError = true
//                }
//            }
//        }.store(in: &subs)
    }
}
