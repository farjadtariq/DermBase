//
//  NPIValidation.swift
//  DermBase
//
//  Created by Farjad on 10/05/2023.
//

import Foundation

func isValidNPI(npi: String) -> Bool
{
    // Check if the NPI number has exactly 10 digits
    if npi.count == 10, npi.allSatisfy({ $0.isNumber })
    {
        return true
    }
    return false
}

