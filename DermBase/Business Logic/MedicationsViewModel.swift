// DataManager.swift
// DermBase
//
// View Model for managing medications data
// Created by Farjad on 20/04/2023.

import SwiftUI
import Firebase
import Combine

class MedicationsViewModel: ObservableObject
{
    // Create list to store medications
    @Published var medications = [Medication]()
    
    // Create list to store favorite medications
    @Published var savedMedications: [Medication] = []
    
    // Add a new property to store the user's ID
    @Published var userUID: String = ""
    
    // Creating variables for the filter function
    @Published var searchText: String = ""
    @Published var selectedCategory: String = "All"
    @Published var selectedYearRange: String = "All"
    @Published var suitableForChildren: Bool = false
    @Published var suitableForPregnancy: Bool = false
    @Published var suitableForBreastfeeding: Bool = false
    @Published var isInjection: Bool = false
    @Published var isTablet: Bool = false
    @Published var isTopical: Bool = false
    
    
    // Create instances of cacheManager, firstoreManager and firestoreListener
    private let cacheManager = CacheManager()
    private let firestoreManager = FirestoreManager(collectionNames: CollectionNames.categories)
    private let firestoreListener = FirestoreListener()
    
    init()
    {
        // Load cached data if available
        loadCachedData()

        // Add Firestore listeners for real-time updates
        addFirestoreListeners()
    }
    
    
    
    // Filter medications based on searchText, selectedCategory, yearRange, age, safeForPregnancy and safeForBreastfeeding
    func filteredMedications(saved: Bool = false) -> [Medication] {
        let list = saved ? sortedSavedMedications : sortedMedications

        let filter = MedicationFilter(medications: list,
                                      searchText: searchText,
                                      selectedCategory: selectedCategory,
                                      selectedYearRange: selectedYearRange,
                                      suitableForChildren: suitableForChildren,
                                      suitableForPregnancy: suitableForPregnancy,
                                      suitableForBreastfeeding: suitableForBreastfeeding,
                                      isInjection: isInjection,
                                      isTablet: isTablet,
                                      isTopical: isTopical)
        
        let filteredMedications = filter.filterMedications()
        
        return filteredMedications
    }


    // Sort Medications List
    private var sortedMedications: [Medication]
    {
        return medications.sorted { $0.trade.localizedStandardCompare($1.trade) == .orderedAscending }
    }
        
    // Sort Saved Medications List
    private var sortedSavedMedications: [Medication]
    {
        return savedMedications.sorted { $0.trade.localizedStandardCompare($1.trade) == .orderedAscending }
    }

    // Create cache to minimize read/writes to firestore
    private func loadCachedData()
    {
        // Check if there's any cached data available
        if let cachedMedications = cacheManager.loadMedications()
        {
            self.medications = cachedMedications
        }
        else
        {
            // Fetch medications from Firestore
            firestoreManager.getMedications { medications in
                self.medications = medications
                    
                // Save the medications data to the cache
                self.cacheManager.saveMedications(medications)
            }
        }
        
        // Load savedMedications from cache
        if let cachedSavedMedications = cacheManager.loadSavedMedications()
        {
            self.savedMedications = cachedSavedMedications
        }
    }
    
    // Listen for changes made to firestore so cached data can be updated as well
    private func addFirestoreListeners()
    {
        firestoreListener.addFirestoreListeners(for: CollectionNames.categories) { [weak self] medication, category, changeType in
            guard let self = self else { return }
            
            // Determine if the medication is in the savedMedications list
            let isSaved = self.savedMedications.contains(where: { $0.id == medication.id })
            
            // Process the change from Firestore
            switch changeType {
            case .added:
                if !self.medications.contains(where: { $0.id == medication.id }) {
                    self.medications.append(medication)
                }
                
                // If the medication is saved, add it to the savedMedications list
                if isSaved {
                    self.savedMedications.append(medication)
                }
            case .modified:
                if let index = self.medications.firstIndex(where: { $0.id == medication.id }) {
                    self.medications[index] = medication
                }
                
                // If the medication is saved, update it in the savedMedications list
                if isSaved {
                    if let savedIndex = self.savedMedications.firstIndex(where: { $0.id == medication.id }) {
                        self.savedMedications[savedIndex] = medication
                    }
                }
            case .removed:
                self.medications.removeAll(where: { $0.id == medication.id })
                
                // If the medication is saved, remove it from the savedMedications list
                if isSaved {
                    self.savedMedications.removeAll(where: { $0.id == medication.id })
                }
            }
            
            // Save the updated medications and savedMedications data to the cache
            self.cacheManager.saveMedications(self.medications)
            self.cacheManager.saveSavedMedications(self.savedMedications)
        }
    }
}
