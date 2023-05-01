//
//  MedicationsDetailView.swift
//  DermBase
//
//  Created by Farjad on 27/04/2023.
//

import SwiftUI
import SafariServices

struct MedicationsDetailView: View
{
    
    var medication: Medication
    var category: String
    @State private var showSafariView = false
    
    init(medication: Medication, category: String)
    {
        self.medication = medication
        self.category = category
    }
    
    var body: some View
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
                            
                            Button
                            {
                                //action here
                            }label: {
                                Image(systemName: "star")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Color(hex: "E37825"))
                            }
                        }
                        
                        Divider()
                            .background(.gray)
                            .scaledToFit()
                        
                        // VStacks for the details grouped to avoid clutter
                        Group
                        {
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
                        Group
                        {
                            
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
