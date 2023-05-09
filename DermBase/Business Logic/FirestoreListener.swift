// FirestoreListener.swift
// DermBase
//
// Class to listen for real-time updates in Firestore
// Created by Farjad on 30/04/2023.

import FirebaseFirestore

class FirestoreListener
{
    
    private var listeners = [ListenerRegistration]()
    
    // Enum to represent the type of document change in Firestore
    enum DocumentChangeType
    {
        case added
        case modified
        case removed
    }
    
    // Function to add Firestore listeners for the given collections
    func addFirestoreListeners(for collections: [String], onUpdate: @escaping (Medication, String, DocumentChangeType) -> Void)
    {
        let firestoreManager = FirestoreManager(collectionNames: collections)
        
        // Iterate through each collection
        for selectedCategory in firestoreManager.collectionNames
        {
            let medicationsRef = firestoreManager.db.collection(selectedCategory)

            // Add a snapshot listener to listen for changes in the collection
            let listener = medicationsRef.addSnapshotListener { (querySnapshot, error) in
                if let error = error
                {
                    print("Error fetching real-time updates: \(error)")
                    return
                }
                
                // Iterate through the document changes
                querySnapshot?.documentChanges.forEach { change in
                    let document = change.document
                    
                    // Create a Medication object from the document data
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
                    
                    // Determine the type of document change
                    let changeType: DocumentChangeType
                    switch change.type {
                    case .added:
                        changeType = .added
                    case .modified:
                        changeType = .modified
                    case .removed:
                        changeType = .removed
                    }
                                   
                    // Call the onUpdate closure with the medication, category, and change type
                    onUpdate(medication, selectedCategory, changeType)
                }
            }
            
            // Add the listener to the listeners array
            listeners.append(listener)
        }
    }
    
    // Remove all listeners when the FirestoreListener object is deallocated
    deinit
    {
        listeners.forEach { $0.remove() }
    }
}
