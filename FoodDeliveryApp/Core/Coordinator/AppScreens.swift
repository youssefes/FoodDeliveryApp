//
//  AppScreens.swift
//  mutwafa
//
//  Created by Mader's Macbook Pro on 10/07/2025.
//

import Foundation
enum AppScreens: Hashable {
    case onborading
    case start
    case login
    case register
    case forgotPassword
    case newPassword
    case order
    case orderDetails(id: Int)
    case Settings
    case AddNewOrder
}
