//
//  FirestoreListener.swift
//  DermBase
//
//  Created by Farjad on 30/04/2023.
//

import FirebaseFirestore

class FirestoreListener {
    
    private var listeners = [ListenerRegistration]()
    
    enum DocumentChangeType {
        case added
        case modified
        case removed
    }
    
    func addFirestoreListeners(for collections: [String], onUpdate: @escaping (Medication, String, DocumentChangeType) -> Void) {
        let firestoreManager = FirestoreManager(collectionNames: collections)
        
        for selectedCategory in firestoreManager.collectionNames {
            let medicationsRef = firestoreManager.db.collection(selectedCategory)

            let listener = medicationsRef.addSnapshotListener { (querySnapshot, error) in
                if let error = error {
                    print("Error fetching real-time updates: \(error)")
                    return
                }
                
                querySnapshot?.documentChanges.forEach { change in
                    let document = change.document
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
                    
                    let changeType: DocumentChangeType
                    switch change.type {
                    case .added:
                        changeType = .added
                    case .modified:
                        changeType = .modified
                    case .removed:
                        changeType = .removed
                    }
                                   
                    onUpdate(medication, selectedCategory, changeType)

                }
            }
            
            listeners.append(listener)
        }
    }
    
    deinit {
        listeners.forEach { $0.remove() }
    }
}
