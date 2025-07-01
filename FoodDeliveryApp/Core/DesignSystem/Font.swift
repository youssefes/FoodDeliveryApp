//
//  Font.swift
//
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import Foundation

enum AppFont: String {
    case bold = "Gotham-Bold"
    case medium = "Gotham-Medium"
    case light = "Gotham-Light"
    case roundedBold = "GothamRnd-Bold"
    var name: String {
        return self.rawValue
    }
}
