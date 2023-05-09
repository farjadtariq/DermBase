//
//  FooterView.swift
//  DermBase
//
//  Created by Farjad on 14/04/2023.
//

import SwiftUI

struct HomeView: View
{
    // Environment objects for medications view model
    @EnvironmentObject var medViewModel: MedicationsViewModel
    
    init()
    {
        // Used to modify the default gray appearance of the icons in tabView
        UITabBar.appearance().unselectedItemTintColor = .white
    }
    
    var body: some View
    {
        // Creates a footer tab for navigation in home view
        TabView
        {
            MedicationsView()
                .environmentObject(medViewModel)
                .tabItem {
                    Label("Medications", systemImage: "pills")
                        .foregroundColor(Color.white)
                }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                        .foregroundColor(Color.white)
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                        .foregroundColor(Color.white)
                }
            
        }
        .tint(Color(hex: "E37825"))
        //.accentColor(Color(hex: "E37825"))
        .navigationBarBackButtonHidden()
    }
}

struct HomeView_Previews: PreviewProvider
{
    static var previews: some View
    {
        HomeView()
    }
}
