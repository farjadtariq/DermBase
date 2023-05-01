//
//  SearchBar.swift
//  DermBase
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
        ZStack(alignment: .trailing) {
            TextField("Search", text: $text)
                .padding(.trailing, showClearButton ? 25 : 0)
                .foregroundColor(Color(hex: "1C3968"))
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .background(Color.white)
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
            
            if showClearButton {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color.gray)
                }
                .padding(.trailing, 20)
                .padding(.top, 15)
            }
            
        }
    
        /*
        TextField("Search", text: $text)
            .foregroundColor(Color.black)//Color(hex: "1C3968"))
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(hex: "E37825"), lineWidth: 2)
            )
            .padding(.horizontal)
            .padding(.top)
         */
    }
}

/*
 .background(Color.gray.opacity(0.3))
 .foregroundColor(Color.gray)
 .cornerRadius(10)
 */
