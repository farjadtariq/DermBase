//
//  DataModel-Medications.swift
//  DermBase
//  Data Model
//
//  Created by Farjad on 20/04/2023.
//

struct Medication: Codable
{
    var id: String
    var category: String
    
    var baselineLabs: String
    var contraindications: String
    var dosingAdjustments: String
    var enrollmentForm: String
    var generic: String
    var indication: String
    var indicationAges: String
    var initiationDosing: String
    var maintenanceDosing: String
    var mechanismOfAction: String
    var metabolisingEnzymes: String
    var recommendedTimeFrame: String
    var resourcesUsed: String
    var route: String
    var sideEffects: String
    var sideEffectsAbrev: String
    var trade: String
    var yearApproved: String
}

