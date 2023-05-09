//
//  FavoritesView.swift
//  DermBase
//
//  Created by Farjad on 14/04/2023.
//

import SwiftUI

struct FavoritesView: View
{
    @State private var searchText: String = ""
    @State private var selectedCategory: String = "All"
    
    @EnvironmentObject var viewModel: AppViewModel
    @EnvironmentObject var medViewModel: MedicationsViewModel
    
    var body: some View
    {
        content
    }
    
    var content: some View
    {
        CustomNavigationBar(title: "Favorites", showBackButton: false)
        {
            VStack
            {
                SearchBar(text: $medViewModel.searchText)
                
                CategoryPicker(selectedCategory: $medViewModel.selectedCategory)
                
                List(medViewModel.filteredMedications(saved: true), id: \.id) { medication in
                    NavigationLink(destination: MedicationsDetailView(medication: medication, category: medication.category)) {
                        Text(medication.trade)
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
                .listStyle(PlainListStyle())
                .padding(.horizontal)
                Spacer()
                
            }
            .background(Color.white)
            Spacer()
        }
    }
}

struct FavoritesView_Previews: PreviewProvider
{
    static var previews: some View
    {
        FavoritesView()
    }
}
