//
//  SearchBar.swift
//  DermBase
//
//  Created by Farjad on 14/04/2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        TextField("Search", text: $text)
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
    }
}
