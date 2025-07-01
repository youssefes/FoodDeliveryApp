//
//  Coler.swift
//
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import Foundation
import SwiftUI

extension DesignSystem {
    enum Colors: String {
        case main = "main"
        case background = "background"
        case description = "description"
        case title = "title"
        var color: Color {
            switch self {
            case .main,.background,.description,.title:
                return Color(self.rawValue)
            }
        }
    }
}
