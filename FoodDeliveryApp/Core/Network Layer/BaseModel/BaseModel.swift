//
//  BaseModel.swift
//
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import Foundation

// MARK: - BaseModel

struct BaseModel<T: Codable>: Codable {
    let success: Bool?
    let data: T?
}
