//
//  AppViewModel.swift
//  DermBase
//
//  Authentication View Model: Defines functions for signIn and signUp to
//  facilitate logging in and out of the app
//
//  Created by Farjad on 17/04/2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore


class AppViewModel: ObservableObject
{
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    @Published var signedUp = false
    
    @Published var emailNotVerified = false
    
    // Create an instance of FirestoreManager
    let firestoreManager = FirestoreManager(collectionNames: [])
    
    var isSignedIn: Bool
    {
        return auth.currentUser != nil
    }
    
    var authStateListenerHandle: AuthStateDidChangeListenerHandle?
    
    //initializer to automatically log user in if prev state was logged in
    init()
    {
        //error handling to check if user exists or not anymore
        authStateListenerHandle = auth.addStateDidChangeListener { [weak self] auth, user in
            if user != nil {
                self?.checkUserToken()
            }
        }
        
        //successfully assign state otherwise
        self.signedIn = isSignedIn
    }
    
    //deinitialize listener when AppViewModel gets deallocated
    deinit {
        if let handle = authStateListenerHandle {
            auth.removeStateDidChangeListener(handle)
        }
    }
    
    // Sign In function
    func signIn(email: String, password: String)
    {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let user = result?.user, error == nil else {
                return
            }
            
            if user.isEmailVerified {
                DispatchQueue.main.async {
                    // Success
                    self?.signedIn = true
                }
            } else {
                DispatchQueue.main.async {
                    self?.emailNotVerified = true
                }
            }
        }
    }
    
    // Sign Up function
    func signUp(email: String, password: String, firstName: String, lastName: String, gender: String, completion: @escaping (Error?) -> Void)
    {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let user = result?.user, error == nil else {
                completion(error)
                return
            }
            
            //sends an email verification upon successful sign up
            user.sendEmailVerification { error in
                if let error = error {
                    completion(error)
                }
                else {
                    DispatchQueue.main.async {
                        // Success
                        self?.signedIn = false
                        self?.signedUp = true
                        completion(nil)
                    }
                }
            }
            
            //add User Data to Firestore
            self?.firestoreManager.addUserDataToFirestore(userUID: user.uid, firstName: firstName, lastName: lastName, gender: gender, email: email) { error in
                if let error = error {
                    completion(error)
                }
            }
        }
    }
    
    // Sign Out function
    func signOut()
    {
        try? auth.signOut()
        
        self.signedIn = false
    }
    
    //Helper function to check if user token is valid
    func checkUserToken() {
        auth.currentUser?.getIDTokenResult(completion: { result, error in
            if let error = error {
                print("Error fetching ID token: \(error)")
                return
            }
            
            if result?.claims["exp"] == nil {
                self.signedIn = false
            }
        })
    }
    
    @objc func handleAppDidBecomeActive() {
        checkUserToken()
    }
    
}

