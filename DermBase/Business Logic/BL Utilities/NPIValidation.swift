//
//  NPIValidation.swift
//  DermBase
//
//  Created by Farjad on 10/05/2023.
//

import Foundation

func isValidNPI(npi: String) -> Bool {
    // Check if the NPI number has exactly 10 digits
    guard npi.count == 10, let _ = Int(npi) else {
        return false
    }

    // Calculate the checksum using the Luhn algorithm
    var sum = 0
    let reversedNPI = String(npi.reversed())
    for (index, character) in reversedNPI.enumerated() {
        if let digit = character.wholeNumberValue {
            if index % 2 == 0 {
                // Double every other digit
                let doubledDigit = digit * 2
                // If the result is two digits, add them together
                sum += doubledDigit >= 10 ? doubledDigit - 9 : doubledDigit
            } else {
                sum += digit
            }
        }
    }

    // The NPI number is valid if the sum is a multiple of 10
    return sum % 10 == 0
}
