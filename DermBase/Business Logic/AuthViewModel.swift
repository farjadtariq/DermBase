//
//  AppViewModel.swift
//  DermBase
//
//  This file manages the app's authentication state and user interactions
//  with authentication features such as signIn, signUp, and signOut.
//  It also manages the user's favorite medications.
//
//  Created by Farjad on 17/04/2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore


class AppViewModel: ObservableObject
{
    // Create instance of Authentication
    let auth = Auth.auth()
    
    // Observable properties for tracking user state
    @Published var signedIn = false
    @Published var signedUp = false
    @Published var emailNotVerified = false
    
    // Create instances of FirestoreManager
    let firestoreManager = FirestoreManager(collectionNames: [])

    // Property to check if a user is currently signed in
    var isSignedIn: Bool
    {
        return auth.currentUser != nil
    }
    
    // Property to store the auth state listener handle
    var authStateListenerHandle: AuthStateDidChangeListenerHandle?
    
    //initializer to automatically log user in if prev state was logged in
    init()
    {
        // Add an auth state listener to handle user state changes
        authStateListenerHandle = auth.addStateDidChangeListener { [weak self] auth, user in
            if user != nil {
                self?.checkUserToken()
            }
        }
        
        // Successfully assign initial state otherwise
        self.signedIn = isSignedIn
    }
    
    // Deinitialize the listener when AppViewModel gets deallocated
    deinit {
        if let handle = authStateListenerHandle {
            auth.removeStateDidChangeListener(handle)
        }
    }
    
    // Sign In function
    func signIn(email: String, password: String)
    {
        // Call Firebase signIn function with provided email and password
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let user = result?.user, error == nil else {
                return
            }
            
            // Check if the user's email is verified
            if user.isEmailVerified {
                DispatchQueue.main.async {
                    // Update the user token
                    self?.checkUserToken()
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
        // Call Firebase createUser function with provided email and password
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let user = result?.user, error == nil else {
                completion(error)
                return
            }
            
            // Sends an email verification upon successful sign up
            user.sendEmailVerification { error in
                if let error = error {
                    completion(error)
                }
                else {
                    DispatchQueue.main.async {
                        // Update the signedUp state and call the completion handler
                        self?.signedIn = false
                        self?.signedUp = true
                        completion(nil)
                    }
                }
            }
            
            // Add User Data to Firestore
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
    
    // Helper function to check if user token is valid
    func checkUserToken()
    {
        // Fetch ID token result and check the token's expiration claim and email verification status
        auth.currentUser?.getIDTokenResult(completion: { [weak self] result, error in
            if let error = error {
                print("Error fetching ID token: \(error)")
                return
            }
            
            if result?.claims["exp"] == nil || !(self?.auth.currentUser?.isEmailVerified ?? false) {
                DispatchQueue.main.async {
                    self?.signedIn = false
                }
            } else {
                DispatchQueue.main.async {
                    self?.signedIn = true
                }
            }
        })
    }

    // Function to handle when the app becomes active
    @objc func handleAppDidBecomeActive() {
        checkUserToken()
    }
    
    // Function to add a favorite medication to the user's favorites in Firestore
    func addFavoriteMedication(medicationDocumentID: String, completion: @escaping (Error?) -> Void) {
        guard let userUID = auth.currentUser?.uid else { return }
        firestoreManager.addFavoriteMedication(userUID: userUID, medicationDocumentID: medicationDocumentID, completion: completion)
        
    }

    // Function to remove a favorite medication from the user's favorites in Firestore
    func removeFavoriteMedication(medicationDocumentID: String, completion: @escaping (Error?) -> Void) {
        guard let userUID = auth.currentUser?.uid else { return }
        firestoreManager.removeFavoriteMedication(userUID: userUID, medicationDocumentID: medicationDocumentID, completion: completion)
    }

    // Function to fetch favorite medication IDs for the logged-in user
    func fetchFavoriteMedicationIDs(completion: @escaping (Result<[String], Error>) -> Void) {
        guard let userUID = auth.currentUser?.uid else {
            completion(.failure(NSError(domain: "No user is logged in.", code: -1, userInfo: nil)))
            return
        }
        firestoreManager.fetchFavoriteMedicationIDs(userUID: userUID, completion: completion)
    }

}
