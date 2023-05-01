//
//  MedicationsView.swift
//  DermBase
//
//  Created by Farjad on 08/04/2023.
//

import SwiftUI

struct MedicationsView: View
{
    @ObservedObject var viewModel = MedicationsViewModel()

    var body: some View
    {
        CustomNavigationBar(title: "Medications", showBackButton: false)
        {
            VStack
            {
                SearchBar(text: $viewModel.searchText)
                
                CategoryPicker(selectedCategory: $viewModel.selectedCategory)

                Divider()
                    .background(.gray)
                    .scaledToFit()
                
                List(viewModel.filteredMedications, id: \.id) { medication in
                    NavigationLink(destination: MedicationsDetailView(medication: medication, category: medication.category))
                    {
                        Text(medication.trade)
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

                }
                .listStyle(PlainListStyle())
                .padding(.horizontal)
        
            }
            .background(Color.white)
            
            FooterView()
                .background(Color(hex: "1C3968"))
        }
        .navigationBarBackButtonHidden()
    }
}

struct AlphabetSlider: View
{
    let letterTapped: (String) -> Void
    
    var body: some View
    {
        ScrollView
        {
            VStack
            {
                ForEach(65..<91) { i in
                    Button(action: {
                        letterTapped(String(UnicodeScalar(i)!))
                    }) {
                        Text(String(UnicodeScalar(i)!))
                            .frame(width: 20)
                    }
                }
            }
        }
    }
}


/*
struct MedicationList: View {
    var searchText: String
    var selectedCategory: String
    
    var body: some View {
 //CategoryMenu(selectedCategory: $selectedCategory)

 Image("Meds")
     .resizable()
     .scaledToFit()
 
 
 //printList(list: medications)
 /*
 HStack {
     ScrollViewReader { proxy in
         ScrollView {
             VStack(alignment: .leading, spacing: 12) {
                 ForEach(medViewModel.medications) { medication in
                     Text(medication.trade)
                         .id(medication.id)
                 }
             }
             .padding(.horizontal)
         }
         
         AlphabetSlider { letter in
             if let medication = medViewModel.medications.first(where: { $0.trade.uppercased().starts(with: letter) }) {
                 withAnimation {
                     proxy.scrollTo(medication.id, anchor: .top)
                 }
             }
         }
         .frame(maxWidth: .infinity, alignment: .trailing)
     }
     
 }*/
 
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
