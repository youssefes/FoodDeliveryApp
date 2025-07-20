//
//  AgeValidator.swift
//  POMacArch
//
//  Created by Mohamed gamal on 05/05/2021.
//  Copyright © 2021 POMac. All rights reserved.
//

import Foundation

struct AgeValidator: Validatable {
    func validate(_ value: String) throws {
        guard value.count > 0 else {throw ValidationError("AgeMissingError", type: .age)}
        guard Int(value) != nil else {throw ValidationError("AgeNotNumber", type: .age)}
        guard value.count < 3 else {throw ValidationError("AgeIsNotValidError", type: .age)}
    }
}
