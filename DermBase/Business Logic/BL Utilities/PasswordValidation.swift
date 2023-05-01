//
//  PasswordValidation.swift
//  DermBase
//
//  Created by Farjad on 17/04/2023.
//

import SwiftUI

func isValidPassword(password: String) -> Bool
{
    //minimum 8 characters long
    //1 uppercase alphabet
    //1 lowercase alphabet
    //1 special character
    
    let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
    
    return passwordTest.evaluate(with: password)
}
