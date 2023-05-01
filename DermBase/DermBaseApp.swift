//
//  DermBaseApp.swift
//  DermBase
//
//  Created by Farjad on 02/04/2023.
//

import SwiftUI
import FirebaseCore
import Firebase

@main
struct DermBaseApp: App
{
    @StateObject var viewModel = AppViewModel()
    @StateObject var medViewModel = MedicationsViewModel()

    init()
    {
        FirebaseApp.configure()
    }
    
    var body: some Scene
    {
        WindowGroup
        {
            NavigationView
            {
                
                GetStarted()
       
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarBackButtonHidden()
            .environmentObject(viewModel)
            .environmentObject(medViewModel)
        }
    }
}
