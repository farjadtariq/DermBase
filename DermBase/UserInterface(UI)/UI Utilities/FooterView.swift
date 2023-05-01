//
//  FooterView.swift
//  DermBase
//
//  Created by Farjad on 14/04/2023.
//

import SwiftUI
import Combine


struct FooterView: View {
    var body: some View {
        HStack(spacing: 30)
        {
            NavigationLink(destination: MedicationsView())
            {
                VStack
                {
                    Image(systemName: "pills")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Medications")
                        .font(.caption)
                        .fontWeight(.regular)
                }
            }
            
            Divider()
                .background(Color.white)
                .frame(height: 30)
                       
            NavigationLink(destination: FavoritesView())
            {
                VStack
                {
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Favorites")
                        .font(.caption)
                        .fontWeight(.regular)
                }
            }
            
            Divider()
                .background(Color.white)
                .frame(height: 30)
                       
            NavigationLink(destination: SettingsView())
            {
                VStack
                {
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Settings")
                        .font(.caption)
                        .fontWeight(.regular)
                }
            }
        
        }
        .foregroundColor(.white)
        //.edgesIgnoringSafeArea(.bottom)
        //.padding(.bottom)
    }
}

/*
struct FooterView: View {
    @State private var selectedTab: Tab = .medications

    var body: some View {
        TabView(selection: $selectedTab) {
            MedicationsView()
                .tag(Tab.medications)
                .tabItem {
                    VStack {
                        Image(systemName: "pills")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Medications")
                            .font(.caption)
                            .fontWeight(.regular)
                    }
                }.foregroundColor(selectedTab == .medications ? Color(hex: "E37825") : Color.white)
            
            FavoritesView()
                .tag(Tab.favorites)
                .tabItem {
                    VStack {
                        Image(systemName: "star")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Favorites")
                            .font(.caption)
                            .fontWeight(.regular)
                    }
                }.foregroundColor(selectedTab == .favorites ? Color(hex: "E37825") : Color.white)
            
            SettingsView()
                .tag(Tab.settings)
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Settings")
                            .font(.caption)
                            .fontWeight(.regular)
                    }
                }.foregroundColor(selectedTab == .settings ? Color(hex: "E37825") : Color.white)
        }
        .background(Color(hex: "1C3968"))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct Footer_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
*/
