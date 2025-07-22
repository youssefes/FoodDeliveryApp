//
//  SettingsViewModel.swift
//  Created by Asset's Macbook Pro on 21/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import Foundation
import Combine
import UIKit
struct ProfileItem: Hashable {
    var image: String
    var name: String
    var logOut: Bool = false
    var delete: Bool = false
    var langauge: Bool = false
}

class SettingsViewModel: BaseViewModel, ObservableObject {
    @Published var profileImage: String = ""
    @Published var userName: String = ""
    
    @Published var profileItems: [ProfileItem]  = [
        ProfileItem(image: "notification", name: "Notifications"),
        ProfileItem(image: "Profile", name: "My Profile"),
        ProfileItem(image: "Message", name: "About Us"),
        ProfileItem(image: "Message", name: "Privacy Policy"),
        ProfileItem(image: "power", name: "Logout", logOut: true)
    ]
    
    private var getProfileUseCase: GetProfileUseCaseProtocol
    
    init(getProfileUseCase: GetProfileUseCaseProtocol = GetProfileUseCase()) {
        self.getProfileUseCase = getProfileUseCase
    }
    // MARK: - get Profile request
    func getProfile() {
        Task { @MainActor [weak self] in
            guard let self else {return}
            do {
                let user = try await getProfileUseCase.getProfile()
                UserUtilites.saveUser(userDate: user)
                profileImage = user.image
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
}
