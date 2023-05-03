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
            .navigationBarBackButtonHidden()
    }
    
    var content: some View
    {
        CustomNavigationBar(title: "Settings")
        {
            ZStack
            {
                Color.white
                
                VStack
                {
                    List {
                        NavigationLink(destination: AccountInformationView()) {
                            Text("Account Information")
                                .font(.headline)
                        }
                        
                        NavigationLink(destination: PrivacyPolicyView()) {
                            Text("Privacy Policy")
                                .font(.headline)
                        }
                        
                        NavigationLink(destination: TermsOfServiceView()) {
                            Text("Terms of Service")
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
                    
                }
                .padding(.bottom)
                .padding(.bottom)
            }
            .ignoresSafeArea(.all)
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
