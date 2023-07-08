//
//  Filter.swift
//  DermBase
//
//  Created by Farjad on 02/06/2023.
//

import Foundation

class MedicationFilter {
    // Properties
    var medications: [Medication]
    var searchText: String
    var selectedCategory: String
    var selectedYearRange: String
    var suitableForChildren: Bool
    var suitableForPregnancy: Bool
    var suitableForBreastfeeding: Bool
    var isInjection: Bool
    var isTablet: Bool
    var isTopical: Bool
    
    // Init
    init(medications: [Medication], searchText: String, selectedCategory: String, selectedYearRange: String, suitableForChildren: Bool, suitableForPregnancy: Bool, suitableForBreastfeeding: Bool, isInjection: Bool, isTablet: Bool, isTopical: Bool) {
        self.medications = medications
        self.searchText = searchText
        self.selectedCategory = selectedCategory
        self.selectedYearRange = selectedYearRange
        self.suitableForChildren = suitableForChildren
        self.suitableForPregnancy = suitableForPregnancy
        self.suitableForBreastfeeding = suitableForBreastfeeding
        self.isInjection = isInjection
        self.isTablet = isTablet
        self.isTopical = isTopical
    }
    
    // Function to filter medications
    func filterMedications() -> [Medication] {
        let filteredBySearchText = filterBySearchText()
        let filteredByCategory = filterByCategory(filteredBySearchText)
        let filteredByYear = filterByYear(filteredByCategory)
        let filteredByAge = filterByAge(filteredByYear)
        let filteredByPregnancy = filterByPregnancy(filteredByAge)
        let filteredByBreastfeeding = filterByBreastfeeding(filteredByPregnancy)
        let filteredByInjection = filterByInjection(filteredByBreastfeeding)
        let filteredByTablet = filterByTablet(filteredByInjection)
        let filteredByCream = filterByCream(filteredByTablet)
        return filteredByCream
    }

    // Filter by search text
    private func filterBySearchText() -> [Medication] {
        return searchText.isEmpty ? medications : medications.filter { medication in
            medication.trade.lowercased().contains(searchText.lowercased())
                || medication.generic.lowercased().contains(searchText.lowercased())
        }
    }

    // Filter by category
    private func filterByCategory(_ medications: [Medication]) -> [Medication] {
        return selectedCategory == "All" ? medications : medications.filter { medication in
            medication.category == selectedCategory
        }
    }

    // Filter by year
    private func filterByYear(_ medications: [Medication]) -> [Medication] {
        if selectedYearRange == "All" {
            // No year range filter applied
            return medications
        } else {
            // Year range filter applied
            return medications.filter { medication in
                guard let yearApproved = Int(medication.yearApproved.components(separatedBy: " ")[0]) else { return false }
                
                // Split the selected range into start and end years
                let yearRange = selectedYearRange.components(separatedBy: "-")
                guard let yearStart = Int(yearRange[0]) else { return false }
                let yearEnd: Int? = yearRange.count > 1 ? Int(yearRange[1]) : nil
                
                // Check if the medication's approved year falls within the selected range
                if let yearEnd = yearEnd {
                    return (yearApproved >= yearStart) && (yearApproved <= yearEnd)
                } else {
                    return yearApproved >= yearStart
                }
            }
        }
    }

    // Filter by age
    private func filterByAge(_ medications: [Medication]) -> [Medication] {
        if suitableForChildren {
            return medications.filter { medication in
                guard let indicationAge = Int(medication.indicationAges.components(separatedBy: " ")[0]) else { return false }
                return indicationAge < 18 // assuming children age is up to 18
            }
        } else {
            return medications
        }
    }

    // Filter by pregnancy
    private func filterByPregnancy(_ medications: [Medication]) -> [Medication] {
        if suitableForPregnancy {
            return medications.filter { medication in
                let useInPregnancy = medication.useInPregnancy.components(separatedBy: ",")[0]
                return useInPregnancy.lowercased() == "yes"
            }
        } else {
            return medications
        }
    }

    // Filter by breastfeeding
    private func filterByBreastfeeding(_ medications: [Medication]) -> [Medication] {
        if suitableForBreastfeeding {
            return medications.filter { medication in
                let useInBreastfeeding = medication.useInBreastfeeding.components(separatedBy: ",")[0]
                return useInBreastfeeding.lowercased() == "yes"
            }
        } else {
            return medications
        }
    }
    
    // Filter by route: injection
    private func filterByInjection(_ medications: [Medication]) -> [Medication] {
        if isInjection {
            return medications.filter { medication in
                return medication.route.contains("Injection")
            }
        } else {
            return medications
        }
    }
    
    // Filter by route: pill
    private func filterByTablet(_ medications: [Medication]) -> [Medication] {
        if isTablet {
            return medications.filter { medication in
                return medication.route.contains("Tablet")
            }
        } else {
            return medications
        }
    }
    
    // Filter by route: cream
    private func filterByCream(_ medications: [Medication]) -> [Medication] {
        if isTopical {
            return medications.filter { medication in
                return medication.route.contains("Topical")
            }
        } else {
            return medications
        }
    }
}
