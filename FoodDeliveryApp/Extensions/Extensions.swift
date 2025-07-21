//
//  Extensions.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import Foundation
import UIKit
extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
extension String {
    /// A localized value form Localizable base on current app loacl
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    /// A Boolean value indicating whether a string has no characters after removing all whitespaces and all newlines.
    var hasValue: Bool {
        let trimmed = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.count != 0
    }

    func removeWhiteSpaces() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }

}

extension String {
    func indexOf(char: Character) -> Int? {
        return firstIndex(of: char)?.utf16Offset(in: self)
    }

    func validate(for type: ValidatorType) throws {
        let validator = ValidatorResolver.validate( for: type)
        return try validator.validate(self)
    }
    func isValid(type: ValidatorType) -> Bool {
        let validator = ValidatorResolver.validate(for: type)
        return validator.isValid(self)
    }

}
