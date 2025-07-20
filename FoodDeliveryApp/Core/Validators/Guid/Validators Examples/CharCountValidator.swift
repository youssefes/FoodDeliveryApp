//
//  CountValidator.swift
//  POMacArch
//
//  Created by Mohamed gamal on 05/05/2021.
//  Copyright © 2021 POMac. All rights reserved.
//

import Foundation

struct CharCountValidator: Validatable {

    private let charCount: Int
    private let stringName: String
    init(charCount: Int,stringName: String) {
        self.charCount = charCount
        self.stringName = stringName
    }

    func validate(_ value: String) throws {
        guard value.count == charCount else {
            throw ValidationError(
                "Invalid \(stringName) must be \(charCount) numbers",
                type: .characterCount(charCount, stringName))
        }
    }

}
