//
//  MobileNumberValidator.swift
//  POMacArch
//
//  Created by Mohamed gamal on 05/05/2021.
//  Copyright © 2021 POMac. All rights reserved.
//

import Foundation

struct MobileNumberValidator: Validatable {

    func validate(_ value: String) throws {
        let number = value
        guard number.count != 0 else {
            throw  ValidationError("Required Field",
                                   type: .mobileNumber)
        }
        
        if !(value.count >= 7) {
            throw ValidationError("invalid Mobile Number",
                                  type: .mobileNumber)
        }
    }
}


struct IbanValid: Validatable {

    func validate(_ value: String) throws {
        let number = value
        guard number.count != 0 else {
            throw  ValidationError("Required Field",
                                   type: .ibanNumber)
        }
        if (value.starts(with: "SA")) {
            if !(value.count >= 24) {
                throw ValidationError("invalid IBAN Number",
                                      type: .ibanNumber)
            }
        }else{
            throw ValidationError("IBAN must be start with SA", type: .ibanNumber)
        }
    }
}
