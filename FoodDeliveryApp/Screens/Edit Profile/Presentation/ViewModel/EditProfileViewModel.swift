//
//  MyProfileViewModel.swift
//  GO
//
//  Created by Ahmed Eltrass on 01/03/2024.
//

import Foundation
import Combine
import UIKit
class EditProfileViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var vaildUserName: Bool = false
    @Published var email: String =   ""
    @Published var vaildEmail: Bool = false
    
    @Published var loaging: Bool = false
    @Published var error: String = ""
    @Published var hasError: Bool = false
    private var subs = Set<AnyCancellable>()
   
    
    // MARK: - login request
    func UpdateProfile() {
//        guard email.isValid(type: .email) else {
//            vaildEmail = true
//            return
//        }
//
    }
}
