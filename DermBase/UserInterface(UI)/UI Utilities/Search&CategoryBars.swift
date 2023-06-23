//
//  CategoryMenu.swift
//  DermBase
//
//  Search and Category bars
//
//  Created by Farjad on 14/04/2023.
//

import SwiftUI

struct SearchBar: View
{
    @Binding var text: String
    
    @State private var showClearButton: Bool = false
    
    var body: some View
    {
        ZStack(alignment: .trailing)
        {
            TextField("Search", text: $text)
                .padding(.trailing, showClearButton ? 25 : 0)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .background(Color(UIColor.systemBackground))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(hex: "E37825"), lineWidth: 2)
                )
                .padding(.horizontal)
                .padding(.top)
                .onChange(of: text) { value in
                    showClearButton = !value.isEmpty
                }
            
            if showClearButton
            {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color.gray)
                }
                .padding(.trailing, 32.5)
                .padding(.top, 15)
            }
        }
    }
}

struct CategoryPicker: View
{
    @Binding var selectedCategory: String
    var defaultCategory : String = "All"
    
    var body: some View
    {
        GeometryReader { geometry in
            ZStack {
                HStack
                {
                    Text("Diseases: \(selectedCategory)")
                    Spacer()
                    Image(systemName: "chevron.down")
                }
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .background(Color(UIColor.systemBackground))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(hex: "E37825"), lineWidth: 2)
                )
                .padding(.horizontal)
                
                Menu
                {
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
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
        }
        .frame(height: 44)
    }
}


