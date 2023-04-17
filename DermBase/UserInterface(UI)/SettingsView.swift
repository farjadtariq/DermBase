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
        NavigationView
        {
            CustomNavigationBar(title: "Settings")
            {
                VStack
                {
                    Spacer()
                    Spacer()
                    
                    Button
                    {
                        viewModel.signOut()
                    } label:
                    
                    {
                        DermButton(title: "Log Out")
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct SettingsView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SettingsView()
    }
}
