//
//  FooterView.swift
//  DermBase
//
//  Created by Farjad on 14/04/2023.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        HStack(spacing: 50)
        {
            NavigationLink(destination: MedicationsView())
            {
                VStack
                {
                    Image(systemName: "pills") 
                    Text("Medications")
                        .fontWeight(.regular)
                }
            }
            NavigationLink(destination: FavoritesView())
            {
                VStack
                {
                    Image(systemName: "star")
                    Text("Favorites")
                        .fontWeight(.regular)
                }
            }
            NavigationLink(destination: SettingsView())
            {
                VStack
                {
                    Image(systemName: "person")
                    Text("Settings")
                        .fontWeight(.regular)
                }
            }
        }
        .foregroundColor(.white)
        .padding(.vertical)
        .frame(maxWidth: .infinity)
    }
}

