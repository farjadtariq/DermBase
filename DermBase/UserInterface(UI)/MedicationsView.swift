//
//  MedicationsView.swift
//  DermBase
//
//  Created by Farjad on 08/04/2023.
//

import SwiftUI

struct MedicationsView: View {
    @State private var searchText: String = ""
    @State private var selectedCategory: String = "All"
    
    var body: some View {
        NavigationView {
            VStack {
                CustomNavigationBar(title: "Medications", showBackButton: false)
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



/*


struct MedicationList: View {
    var searchText: String
    var selectedCategory: String
    
    var body: some View {
        // Implement your medication list here
    }
}
*/



struct MedicationsView_Previews: PreviewProvider
{
    static var previews: some View
    {
        MedicationsView()
    }
}
