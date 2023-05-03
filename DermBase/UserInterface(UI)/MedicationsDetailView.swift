//
//  MedicationsDetailView.swift
//  DermBase
//
//  Created by Farjad on 27/04/2023.
//

import SwiftUI
import FirebaseAuth
import SafariServices

struct MedicationsDetailView: View
{
    
    var medication: Medication
    var category: String
    
    @State private var isFavorite: Bool = false
    @EnvironmentObject var viewModel: AppViewModel
    @EnvironmentObject var medViewModel: MedicationsViewModel
    
    init(medication: Medication, category: String)
    {
        self.medication = medication
        self.category = category
    }
    
    var body: some View
    {
        content
    }
    
    var content: some View
    {
        CustomNavigationBar(title: category)
        {
            ZStack
            {
                Color.white
                    .ignoresSafeArea(.all)
                
                ScrollView
                {
                    VStack(alignment: .leading, spacing: 15)
                    {
                        HStack
                        {
                            Text(medication.trade)
                                .foregroundColor(Color(hex: "1C3968"))
                                .font(.title2)
                                .bold()
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                            
                            FavoriteButton(isFavorite: $isFavorite, medicationID: medication.id)
                                .environmentObject(viewModel)

                        }
                        
                        Divider()
                            .background(.gray)
                            .scaledToFit()
                        
                        
                        MedicationDetailsGroup1(medication: medication)
                        MedicationDetailsGroup2(medication: medication)
                        
                    }
                    .padding()
                    
                }
                
                // Used to create a white space in the safe area
                // to create better scroll view
                VStack
                {
                    Spacer()
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 10)
                        .edgesIgnoringSafeArea(.bottom)
                }
                .ignoresSafeArea(.all)
            }
          
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            isFavorite = medViewModel.savedMedications.contains { $0.id == medication.id }
        }
    }
}

struct MedicationsDetailView_Previews: PreviewProvider
{
    static var previews: some View
    {
        let sampleMedication = Medication(
                    id: "1",
                    category: "Example Category",
                    baselineLabs: "Example Baseline Labs",
                    contraindications: "Example Contraindications",
                    dosingAdjustments: "Example Dosing Adjustments",
                    generic: "Example Generic",
                    indication: "Example Indication",
                    indicationAges: "Example Indication Ages",
                    initiationDosing: "Example Initiation Dosing",
                    maintenanceDosing: "Example Maintenance Dosing",
                    mechanismOfAction: "Example Mechanism Of Action",
                    metabolisingEnzymes: "Example Metabolising Enzymes",
                    pharmacogeneticsStudies: "Example Pharmacogenetics Studies",
                    recommendedTimeFrame: "Example Recommended Time Frame",
                    resourcesUsed: "Example Resources Used",
                    route: "Example Route",
                    sideEffects: "Example Side Effects",
                    sideEffectsAbrev: "Example Side Effects Abrev",
                    trade: "Example Trade",
                    yearApproved: "Example Year Approved"
        )
                
        let sampleCategory = "Example Category"

        return MedicationsDetailView(medication: sampleMedication, category: sampleCategory)
    }
}
