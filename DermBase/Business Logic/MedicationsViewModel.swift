//
//  DataManager.swift
//  DermBase
//
//  Created by Farjad on 20/04/2023.
//

import SwiftUI
import Firebase
import Combine

class MedicationsViewModel: ObservableObject
{
    @Published var medications = [Medication]()
    @Published var searchText: String = ""
    @Published var selectedCategory: String = "All"
    
    private let cacheManager = CacheManager()
    private let firestoreListener = FirestoreListener()
    
    init()
    {
        let firestoreManager = FirestoreManager(collectionNames: CollectionNames.categories)
        
        // Check if there's any cached data available
        if let cachedMedications = cacheManager.loadMedications()
        {
            self.medications = cachedMedications
        }
        else
        {
            firestoreManager.getMedications { medications in
                self.medications = medications
                
                // Save the medications data to the cache
                self.cacheManager.saveMedications(medications)
           }
        }
        
        firestoreListener.addFirestoreListeners(for: CollectionNames.categories) { [weak self] medication, category, changeType in
            guard let self = self else { return }
            
            // Process the change from Firestore
            switch changeType {
            case .added:
                if !self.medications.contains(where: { $0.id == medication.id }) {
                    self.medications.append(medication)
                }
            case .modified:
                if let index = self.medications.firstIndex(where: { $0.id == medication.id }) {
                    self.medications[index] = medication
                }
            case .removed:
                self.medications.removeAll(where: { $0.id == medication.id })
            }
            
            // Save the updated medications data to the cache
            self.cacheManager.saveMedications(self.medications)
        }
    }
    
    var filteredMedications: [Medication] {
        let filteredBySearchText = searchText.isEmpty ? medications : medications.filter { medication in
            medication.trade.lowercased().contains(searchText.lowercased())
            || medication.generic.lowercased().contains(searchText.lowercased())
        }
        
        if selectedCategory == "All"
        {
            return filteredBySearchText
        }
        else
        {
            return filteredBySearchText.filter { medication in
                medication.category == selectedCategory
            }
        }
    }
}
