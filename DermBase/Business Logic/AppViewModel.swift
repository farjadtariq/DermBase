//
//  AppViewModel.swift
//  DermBase
//
//  Use Case: Defines functions for signIn and signUp to
//  facilitate logging in and out of the app
//
//  Created by Farjad on 17/04/2023.
//

import SwiftUI
import FirebaseAuth


class AppViewModel: ObservableObject
{
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool
    {
        return auth.currentUser != nil
    }
    
    // Sign In function
    func signIn(email: String, password: String)
    {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                // Success
                self?.signedIn = true
            }
        }
    }
    
    // Sign Up function
    func signUp(email: String, password: String)
    {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                // Success
                self?.signedIn = true
            }
        }
    }
    
    // Sign Out function
    func signOut()
    {
        try? auth.signOut()
        
        self.signedIn = false
    }
}

