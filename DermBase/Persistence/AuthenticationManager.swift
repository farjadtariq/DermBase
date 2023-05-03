//
//  AuthenticationManager.swift
//  DermBase
//
//  Created by Farjad on 03/05/2023.
//

import FirebaseAuth

class AuthenticationManager {
    let auth = Auth.auth()

    var isSignedIn: Bool {
        return auth.currentUser != nil
    }

    func signIn(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else if let user = result?.user, user.isEmailVerified {
                completion(.success(true))
            } else {
                completion(.success(false))
            }
        }
    }

    func signUp(email: String, password: String, firstName: String, lastName: String, gender: String, firestoreManager: FirestoreManager, completion: @escaping (Result<Bool, Error>) -> Void) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            result?.user.sendEmailVerification { error in
                if let error = error {
                    completion(.failure(error))
                    return
                }

                guard let userUID = result?.user.uid else {
                    completion(.failure(NSError(domain: "User UID not found", code: -1, userInfo: nil)))
                    return
                }

                firestoreManager.addUserDataToFirestore(userUID: userUID, firstName: firstName, lastName: lastName, gender: gender, email: email) { error in
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.success(true))
                    }
                }
            }
        }
    }

    func signOut() {
        try? auth.signOut()
    }

    func checkUserToken(completion: @escaping (Result<Bool, Error>) -> Void) {
        auth.currentUser?.getIDTokenResult { result, error in
            if let error = error {
                completion(.failure(error))
            } else if result?.claims["exp"] == nil {
                completion(.success(false))
            } else {
                completion(.success(true))
            }
        }
    }
}
