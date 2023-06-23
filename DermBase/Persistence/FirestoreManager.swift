//
//  APIManager.swift
//  DermBase
//
//  Created by Farjad on 20/04/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
 
// Class to manage Firestore operations
class FirestoreManager
{
    let collectionNames: [String]
        
    // Initialize FirestoreManager with collection names
    init(collectionNames: [String])
    {
        self.collectionNames = collectionNames
    }
        
    // Create instances of Firestore and Authentication
    let db = Firestore.firestore()
    let auth = Auth.auth()
    
    // Function to fetch medications from Firestore
    func getMedications(completion: @escaping ([Medication]) -> Void)
    {
        // Initialize an empty array to store all medications
        var allMedications = [Medication]()
        
        // Create a DispatchGroup to manage multiple asynchronous calls
        let dispatchGroup = DispatchGroup()

        
        // Iterate through collection names to fetch documents
        for selectedCategory in collectionNames
        {
            // Enter the dispatch group before each async call
            dispatchGroup.enter()
            
            // Get documents from the Firestore collection
            let medicationsRef = db.collection(selectedCategory)
            
            medicationsRef.getDocuments { (querySnapshot, error) in
                if let error = error
                {
                    // Error handling for fetching medications
                    print("Error fetching medications: \(error)")
                    dispatchGroup.leave()
                    return
                }
                
                // Iterate through documents and create medication instances
                for document in querySnapshot!.documents
                {
                    // Get the data from the document
                    let medication = Medication(
                        id: document.documentID,
                        category: selectedCategory,
                        baselineLabs: document["baselineLabs"] as? String ?? "",
                        contraindications: document["contraindications"] as? String ?? "",
                        dosingAdjustments: document["dosingAdjustments"] as? String ?? "",
                        enrollmentForm: document["enrollmentForm"] as? String ?? "",
                        generic: document["generic"] as? String ?? "",
                        indication: document["indication"] as? String ?? "",
                        indicationAges: document["indicationAges"] as? String ?? "",
                        initiationDosing: document["initiationDosing"] as? String ?? "",
                        maintenanceDosing: document["maintenanceDosing"] as? String ?? "",
                        mechanismOfAction: document["mechanismOfAction"] as? String ?? "",
                        metabolisingEnzymes: document["metabolisingEnzymes"] as? String ?? "",
                        recommendedTimeFrame: document["recommendedTimeFrame"] as? String ?? "",
                        resourcesUsed: document["resourcesUsed"] as? String ?? "",
                        route: document["route"] as? String ?? "",
                        sideEffects: document["sideEffects"] as? String ?? "",
                        sideEffectsAbrev: document["sideEffectsAbrev"] as? String ?? "",
                        trade: document["trade"] as? String ?? "",
                        useInBreastfeeding: document["useInBreastfeeding"] as? String ?? "",
                        useInPregnancy: document["useInPregnancy"] as? String ?? "",
                        yearApproved: document["yearApproved"] as? String ?? ""
                    )
                    
                    // Append the medication instance to the allMedications array
                    allMedications.append(medication)
                }
                
                // Leave the dispatch group after processing all documents
                dispatchGroup.leave()
            }
            
        }

        // Notify the main queue after all async calls are completed
        dispatchGroup.notify(queue: .main)
        {
            completion(allMedications)
        }
    }
    
    // Function to add user data to Firestore
    func addUserDataToFirestore(userUID: String, firstName: String, lastName: String, email: String, npi: String, completion: @escaping (Error?) -> Void)
    {
        // Create a dictionary with user data
        let userData: [String: Any] = [
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "npi": npi
        ]
        
        // Set user data in Firestore
        db.collection("users").document(userUID).setData(userData) { error in
            if let error = error
            {
                completion(error)
            }
            else
            {
                completion(nil)
            }
        }
    }
    
    // Function to fetch user data for the given userUID
    func fetchUserData(userUID: String, completion: @escaping (Result<UserData, Error>) -> Void)
    {
        // Get user document reference
        let userDocumentRef = db.collection("users").document(userUID)
        
        // Fetch user document and extract user data
        userDocumentRef.getDocument { (document, error) in
            if let error = error
            {
                completion(.failure(error))
            }
            else if let document = document, document.exists
            {
                let firstName = document.get("firstName") as? String ?? ""
                let lastName = document.get("lastName") as? String ?? ""
                let email = document.get("email") as? String ?? ""
                let npi = document.get("npi") as? String ?? ""
                let userData = UserData(firstName: firstName, lastName: lastName, email: email, npi: npi)
                completion(.success(userData))
            }
            else
            {
                completion(.failure(NSError(domain: "User document not found.", code: -1, userInfo: nil)))
            }
        }
    }
    
    // Function to delete user data from Firestore
    func deleteUserData(userUID: String, completion: @escaping (Error?) -> Void)
    {
        // Get user document reference
        let userDocumentRef = db.collection("users").document(userUID)

        // Delete user document
        userDocumentRef.delete { error in
            if let error = error
            {
                completion(error)
            }
            else
            {
                completion(nil)
            }
        }
    }

    
    // Function to add a favorite medication to user's favorites in Firestore
    func addFavoriteMedication(userUID: String, medicationDocumentID: String, completion: @escaping (Error?) -> Void)
    {
        // Get user document reference
        let userDocumentRef = db.collection("users").document(userUID)

        // Update user document with the added favorite medication
        userDocumentRef.updateData([
            "favorites": FieldValue.arrayUnion([medicationDocumentID])
        ]) { error in
            if let error = error
            {
                completion(error)
            }
            else
            {
                completion(nil)
            }
        }
    }

    // Function to remove a favorite medication from user's favorites in Firestore
    func removeFavoriteMedication(userUID: String, medicationDocumentID: String, completion: @escaping (Error?) -> Void)
    {
        // Get user document reference
        let userDocumentRef = db.collection("users").document(userUID)

        // Update user document with the removed favorite medication
        userDocumentRef.updateData([
            "favorites": FieldValue.arrayRemove([medicationDocumentID])
        ]) { error in
            if let error = error
            {
                completion(error)
            }
            else
            {
                completion(nil)
            }
        }
    }

    // Function to fetch favorite medication IDs for the logged-in user
    func fetchFavoriteMedicationIDs(userUID: String, completion: @escaping (Result<[String], Error>) -> Void)
    {
        // Get user document reference
        let userDocumentRef = db.collection("users").document(userUID)
        
        // Fetch user document and extract favorites array
        userDocumentRef.getDocument { (document, error) in
            if let error = error
            {
                completion(.failure(error))
            }
            else if let document = document, document.exists
            {
                let favorites = document.get("favorites") as? [String] ?? []
                completion(.success(favorites))
            }
            else
            {
                completion(.failure(NSError(domain: "User document not found.", code: -1, userInfo: nil)))
            }
        }
    }
}

