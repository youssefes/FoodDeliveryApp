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

class SettingsViewModel: ObservableObject {
    @Published var showSelectImage: Bool = false
    @Published var showSelectImageGallery: Bool = false
    @Published var coverImage = UIImage()
    @Published var profileImage: String = "https://api.dicebear.com/8.x/avataaars/png?seed=78&size=300"
    @Published var userName: String = ""
    
    
    @Published var profileItems: [ProfileItem]  = [
        ProfileItem(image: "notification", name: "Notifications"),
        ProfileItem(image: "Profile", name: "My Profile"),
        ProfileItem(image: "Message", name: "About Us"),
        ProfileItem(image: "Message", name: "Privacy Policy"),
        ProfileItem(image: "power", name: "Logout", logOut: true)
    ]
    
    // MARK: - login request
    func UpdateProfile() {
        
    }
}
