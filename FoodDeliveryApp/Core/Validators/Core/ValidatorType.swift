//
//  ValidatorType.swift
//  POMacArch
//
//  Created by Mohamed gamal on 05/05/2021.
//  Copyright © 2021 POMac. All rights reserved.
//

import Foundation

public enum ValidatorType: Equatable {
    case email
    case required(localizedFieldName: String)
    case age
    case password
    case confirmPassword(password: String)
    case mobileNumber
    case characterCount(_ count: Int,_  stringName: String)
    case ibanNumber
}
