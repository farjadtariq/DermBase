//
//  CacheManager.swift
//  DermBase
//
// Class to manage caching of medications data
//
//  Created by Farjad on 30/04/2023.
//

import Foundation

class CacheManager
{
    // File name to store cached medications data
    private let medicationsFilename = "MedicationsCache.json"
    
    // File name to store cached saved medications
    private let savedMedicationsFilename = "SavedMedicationsCache.json"
    
    // Access the documents directory for the app
    private let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

    // Function to save medications data to a local file
    func saveMedications(_ medications: [Medication], to filename: String = "MedicationsCache.json")
    {
        let medicationsFileURL = documentsDirectory.appendingPathComponent(filename)
        let encoder = JSONEncoder()
               
        do
        {
            let data = try encoder.encode(medications)
            try data.write(to: medicationsFileURL)
        }
        catch
        {
            print("Error saving medications data: \(error.localizedDescription)")
        }
    }

    // Function to load medications data from a local file
    func loadMedications(from filename: String = "MedicationsCache.json") -> [Medication]?
    {
        let medicationsFileURL = documentsDirectory.appendingPathComponent(filename)
        let decoder = JSONDecoder()
              
        do
        {
            let data = try Data(contentsOf: medicationsFileURL)
            let medications = try decoder.decode([Medication].self, from: data)
            return medications
        }
        catch
        {
            print("Error loading medications data: \(error.localizedDescription)")
            
            // Return an empty array when the file doesn't exist
            return []
        }
    }
    
    // Function to save saved medications data to a local file
    func saveSavedMedications(_ savedMedications: [Medication])
    {
        saveMedications(savedMedications, to: savedMedicationsFilename)
    }

    // Function to load saved medications data from a local file
    func loadSavedMedications() -> [Medication]?
    {
        return loadMedications(from: savedMedicationsFilename)
    }
}
