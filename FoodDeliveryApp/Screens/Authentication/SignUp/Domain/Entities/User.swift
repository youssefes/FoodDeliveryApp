
//  User.swift
//  Created by Asset's Macbook Pro on 21/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import Foundation
struct User : Codable, Equatable, Hashable {
	let id : Int
	var username : String
	let email : String
    var image: String
}
