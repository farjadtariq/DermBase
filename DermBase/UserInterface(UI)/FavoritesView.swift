//
//  FavoritesView.swift
//  DermBase
//
//  Created by Farjad on 14/04/2023.
//

import SwiftUI

struct FavoritesView: View {
    @State private var searchText: String = ""
    @State private var selectedCategory: String = "All"
    
    var body: some View {
        NavigationView {
            VStack {
                CustomNavigationBar(title: "Favorites", showBackButton: false)
                {
                    
                    SearchBar(text: $searchText)
                    
                    //CategoryMenu(selectedCategory: $selectedCategory)
                    
                    //MedicationList(searchText: searchText, selectedCategory: selectedCategory)
                    
                    Spacer()
                    
                    FooterView()
                        .background(Color("1C3968"))
                        .edgesIgnoringSafeArea(.bottom)
                }
                .background(Color.white)
            }
            
        }
        .navigationBarBackButtonHidden()
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
