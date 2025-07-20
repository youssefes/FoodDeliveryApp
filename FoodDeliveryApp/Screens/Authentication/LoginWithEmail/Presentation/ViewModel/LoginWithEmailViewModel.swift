//
//  LoginWithEmailViewModel.swift
//  Created by Asset's Macbook Pro on 20/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import Combine
import Foundation
class LoginWithEmailViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var vaildEmail: Bool = false
    @Published var password: String = ""
    @Published var vaildPassword: Bool = false
    @Published var navigate: Bool = false
    private var subs = Set<AnyCancellable>()
    @Published var loaging: Bool = false
    @Published var error: String = ""
    @Published var hasError: Bool = false
    // MARK: - login request
    func login() {
       
    }
}
