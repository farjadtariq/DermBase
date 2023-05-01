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
    
    var body: some View
    {
        CustomNavigationBar(title: "Favorites", showBackButton: false)
        {
          
            VStack
            {
                SearchBar(text: $searchText)
                
                //CategoryMenu(selectedCategory: $selectedCategory)
                
                //MedicationList(searchText: searchText, selectedCategory: selectedCategory)
                Spacer()
                
            }
            .background(Color.white)
            Spacer()
            FooterView()
                .background(Color(hex: "1C3968"))
            
        }
        .navigationBarBackButtonHidden()

    }
}

struct FavoritesView_Previews: PreviewProvider
{
    static var previews: some View
    {
        FavoritesView()
    }
}
