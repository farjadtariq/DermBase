//
//  MedicationsView.swift
//  DermBase
//
//  Created by Farjad on 08/04/2023.
//

import SwiftUI

struct MedicationsView: View
{
    // Variable to show filter sheet
    @State private var showFilterSheet = false
    
    
    // Create instances of MedicationsViewModel and AppViewModel
    @EnvironmentObject var viewModel: MedicationsViewModel
    @EnvironmentObject var appViewModel: AppViewModel
    
    

    var body: some View
    {
        
        content
            .onAppear {
                appViewModel.fetchFavoriteMedicationIDs { result in
                    switch result {
                    case .success(let favoriteMedicationIDs):
                        viewModel.savedMedications = viewModel.medications.filter {
                            favoriteMedicationIDs.contains($0.id)
                        }
                    case .failure(let error):
                        print("Error fetching favorite medication documentIDs: \(error.localizedDescription)")
                    }
                }
            }
            .sheet(isPresented: $showFilterSheet) {
                FilterSheet(showSheet: $showFilterSheet, selectedYearRange: $viewModel.selectedYearRange, suitableForChildren: $viewModel.suitableForChildren, suitableForPregnancy: $viewModel.suitableForPregnancy, suitableForBreastfeeding: $viewModel.suitableForBreastfeeding, isInjection: $viewModel.isInjection, isTablet: $viewModel.isTablet, isTopical: $viewModel.isTopical)
            }
    }
    
    var content: some View
    {
        CustomNavigationBar(title: "Medications", showBackButton: false)
        {
            VStack
            {
                SearchBar(text: $viewModel.searchText)
                
                CategoryPicker(selectedCategory: $viewModel.selectedCategory)
                
                FilterBar(showFilterSheet: $showFilterSheet)
                
                Divider()
                    .background(.gray)
                    .scaledToFit()
                
                List(viewModel.filteredMedications(), id: \.id) { medication in
                    NavigationLink(destination: MedicationsDetailView(medication: medication, category: medication.category))
                    {
                        Text(medication.trade)
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
                .listStyle(PlainListStyle())
                .padding(.horizontal)
                Spacer()
                
            }
            .background(Color(UIColor.systemBackground))
            Spacer()
        }
    }
}


struct MedicationsView_Previews: PreviewProvider
{
    static var previews: some View
    {
        MedicationsView()
    }
}
