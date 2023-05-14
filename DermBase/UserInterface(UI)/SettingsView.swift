//
//  SettingsView.swift
//  DermBase
//
//  Created by Farjad on 14/04/2023.
//

import SwiftUI

struct SettingsView: View
{
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View
    {
        content
    }
    
    var content: some View
    {
        CustomNavigationBar(title: "Settings", showBackButton: false)
        {
            VStack
            {
                List {
                    NavigationLink(destination: AccountInformationView()) {
                        Text("Account Information")
                            .font(.headline)
                    }
                    
                    NavigationLink(destination: PrivacyTermsView()) {
                        Text("Privacy and Terms")
                            .font(.headline)
                    }
                    
                }
                .listStyle(PlainListStyle())
                
                Spacer()
                
                Button
                {
                    viewModel.signOut()
                } label:
                
                {
                    DermButton(title: "Log Out")
                }
                
                Spacer()
            }
            .background(Color(UIColor.systemBackground))
            Spacer()
        }
    }
}

struct SettingsView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SettingsView()
    }
}
