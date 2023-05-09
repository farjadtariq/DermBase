//
//  FavoriteButton.swift
//  DermBase
//
//  Created by Farjad on 03/05/2023.
//

import SwiftUI

struct FavoriteButton: View
{
    @Binding var isFavorite: Bool
    @EnvironmentObject var viewModel: AppViewModel
    var medicationID: String

    var body: some View
    {
        Button
        {
            isFavorite.toggle()
            
            if isFavorite
            {
                viewModel.addFavoriteMedication(medicationDocumentID: medicationID) { error in
                    if let error = error
                    {
                        print("Add Favorite Error: \(error.localizedDescription)")
                    }
                }
            }
            else
            {
                viewModel.removeFavoriteMedication(medicationDocumentID: medicationID) { error in
                    if let error = error
                    {
                        print("Removing favorite Error: \(error.localizedDescription)")
                    }
                }
            }
        } label: {
            Image(systemName: isFavorite ? "star.fill" : "star")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(Color(hex: "E37825"))
        }
    }
}


struct MedicationDetailsGroup1: View
{
    let medication: Medication
    
    var body: some View
    {
        Group
        {
            // VStacks for the details grouped to avoid clutter
            VStack(alignment: .leading) {
                Text("Year Approved")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "E37825"))
                Text(medication.yearApproved)
                    .font(.body)
            }
            
            VStack(alignment: .leading) {
                Text("Generic")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "E37825"))
                Text(medication.generic)
                    .font(.body)
            }
            
            VStack(alignment: .leading) {
                Text("Indication")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "E37825"))
                Text(medication.indication)
                    .font(.body)
            }
            
            VStack(alignment: .leading) {
                Text("Indication Ages")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "E37825"))
                Text(medication.indicationAges)
                    .font(.body)
            }
            
            VStack(alignment: .leading) {
                Text("Mechanism of Action")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "E37825"))
                Text(medication.mechanismOfAction)
                    .font(.body)
            }
            
            VStack(alignment: .leading) {
                Text("Route")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "E37825"))
                Text(medication.route)
                    .font(.body)
            }
            
            VStack(alignment: .leading) {
                Text("Baseline Labs / Lab Monitoring")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "E37825"))
                Text(medication.baselineLabs)
                    .font(.body)
            }
        }
    }
}

struct MedicationDetailsGroup2: View
{
    let medication: Medication
    @State private var showSafariView = false
    
    var body: some View
    {
        Group
        {
            // VStacks for the details grouped to avoid clutter
            VStack(alignment: .leading) {
                Text("Initiation Dosing")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "E37825"))
                Text(medication.initiationDosing)
                    .font(.body)
            }
            
            VStack(alignment: .leading) {
                Text("Maintenance Dosing")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "E37825"))
                Text(medication.maintenanceDosing)
                    .font(.body)
            }
            
            VStack(alignment: .leading) {
                Text("Dosing Adjustments")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "E37825"))
                Text(medication.dosingAdjustments)
                    .font(.body)
            }
            
            VStack(alignment: .leading) {
                Text("Recommended time frame to assess for initial therapeutic response in weeks")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "E37825"))
                Text(medication.recommendedTimeFrame)
                    .font(.body)
            }
            
            VStack(alignment: .leading) {
                Text("Side Effects")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "E37825"))
                Text(medication.sideEffects)
                    .font(.body)
            }
            
            VStack(alignment: .leading) {
                Text("Side Effects Abrev.")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "E37825"))
                Text(medication.sideEffectsAbrev)
                    .font(.body)
            }
            
            VStack(alignment: .leading) {
                Text("Contraindications / Cautions")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "E37825"))
                Text(medication.contraindications)
                    .font(.body)
            }
            
            VStack(alignment: .leading) {
                Text("Pharmacogenetics Studies")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "E37825"))
                Text(medication.pharmacogeneticsStudies)
                    .font(.body)
            }
            
            VStack(alignment: .leading) {
                Text("Metabolising Enzymes")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "E37825"))
                Text(medication.metabolisingEnzymes)
                    .font(.body)
            }
            
            VStack(alignment: .leading) {
                Text("Resources Used")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "E37825"))
                if let url = URL(string: medication.resourcesUsed), UIApplication.shared.canOpenURL(url)
                {
                    Link("\(url.absoluteString)", destination: url)
                        .font(.body)
                        .foregroundColor(Color.blue)
                        .sheet(isPresented: $showSafariView)
                        {
                            SafariView(url: url)
                        }
                }
                else
                {
                    Text("\(medication.resourcesUsed)")
                        .font(.body)
                }
            }
        }
    }
}
