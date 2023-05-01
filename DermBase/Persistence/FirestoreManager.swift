//
//  APIManager.swift
//  DermBase
//
//  Created by Farjad on 20/04/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
 
class FirestoreManager
{
    let collectionNames: [String]
        
    init(collectionNames: [String])
    {
        self.collectionNames = collectionNames
    }
        
    let db = Firestore.firestore()
    
    func getMedications(completion: @escaping ([Medication]) -> Void)
    {
        var allMedications = [Medication]()
        let dispatchGroup = DispatchGroup()

        for selectedCategory in collectionNames
        {
            dispatchGroup.enter()
            let medicationsRef = db.collection(selectedCategory)
            
            medicationsRef.getDocuments { (querySnapshot, error) in
                if let error = error
                {
                    print("Error fetching medications: \(error)")
                    dispatchGroup.leave()
                    return
                }
                
                // Iterate over the documents
                for document in querySnapshot!.documents
                {
                    // Get the data from the document
                    let medication = Medication(
                        id: document.documentID,
                        category: selectedCategory,
                        baselineLabs: document["baselineLabs"] as? String ?? "",
                        contraindications: document["contraindications"] as? String ?? "",
                        dosingAdjustments: document["dosingAdjustments"] as? String ?? "",
                        generic: document["generic"] as? String ?? "",
                        indication: document["indication"] as? String ?? "",
                        indicationAges: document["indicationAges"] as? String ?? "",
                        initiationDosing: document["initiationDosing"] as? String ?? "",
                        maintenanceDosing: document["maintenanceDosing"] as? String ?? "",
                        mechanismOfAction: document["mechanismOfAction"] as? String ?? "",
                        metabolisingEnzymes: document["metabolisingEnzymes"] as? String ?? "",
                        pharmacogeneticsStudies: document["pharmacogeneticsStudies"] as? String ?? "",
                        recommendedTimeFrame: document["recommendedTimeFrame"] as? String ?? "",
                        resourcesUsed: document["resourcesUsed"] as? String ?? "",
                        route: document["route"] as? String ?? "",
                        sideEffects: document["sideEffects"] as? String ?? "",
                        sideEffectsAbrev: document["sideEffectsAbrev"] as? String ?? "",
                        trade: document["trade"] as? String ?? "",
                        yearApproved: document["yearApproved"] as? String ?? ""
                    )
                    
                    allMedications.append(medication)
                }
                
                dispatchGroup.leave()
            }
            
        }

        dispatchGroup.notify(queue: .main)
        {
            completion(allMedications)
        }
    }
    
    func addUserDataToFirestore(userUID: String, firstName: String, lastName: String, gender: String, email: String, completion: @escaping (Error?) -> Void) {
        let userData: [String: Any] = [
            "firstName": firstName,
            "lastName": lastName,
            "gender": gender,
            "email": email
        ]
        
        db.collection("users").document(userUID).setData(userData) { error in
            if let error = error {
                completion(error)
            } else {
                completion(nil)
            }
        }
    }
}

