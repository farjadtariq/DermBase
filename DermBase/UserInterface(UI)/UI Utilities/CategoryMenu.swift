//
//  CategoryMenu.swift
//  DermBase
//
//  Created by Farjad on 14/04/2023.
//

import SwiftUI

struct CategoryPicker: View
{
    @Binding var selectedCategory: String
    var defaultCategory : String = "All"
    
    var body: some View
    {
        HStack {
            Text("Diseases: \(selectedCategory)")
                .foregroundColor(Color(hex: "1C3968"))
            
            Spacer()
            
            Menu {
                Button(action: {selectedCategory = defaultCategory})
                {
                    Text(defaultCategory).tag(defaultCategory)
                }
                ForEach(CollectionNames.categories, id: \.self) { category in
                    Button(action: {
                        selectedCategory = category
                    }) {
                        Text(category).tag(category)
                    }
                }
            } label: {
                Image(systemName: "chevron.down")
                    .foregroundColor(Color(hex: "1C3968"))
            }
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(hex: "E37825"), lineWidth: 2)
        )
        .padding(.horizontal)
        //.padding(.bottom)

        
    }
}
        /*
        Picker(selection: $selectedCategory, label: Text("Category: \(selectedCategory)").foregroundColor(Color.gray))
        {
            Text(defaultCategory).tag(defaultCategory)
            ForEach(CollectionNames.categories, id: \.self) { category in
                Text(category).tag(category)
            }
        }
        .scaledToFit()
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
        .background(Color.gray.opacity(0.3))
        .foregroundColor(Color(hex: "E37825"))
        .cornerRadius(10)
    }
}
*/

/*
 .background(Color.gray.opacity(0.3))
 .foregroundColor(Color.gray)
 .cornerRadius(10)
 */
