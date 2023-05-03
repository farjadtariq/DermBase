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
    // Initialize the AppViewModel and MedicationsViewModel as StateObject properties
    @StateObject var viewModel = AppViewModel()
    @StateObject var medViewModel = MedicationsViewModel()

    init()
    {
        // Configure Firebase when the app starts
        FirebaseApp.configure()
    }
    
    var body: some Scene
    {
        WindowGroup
        {
            // Create a NavigationView as the main container for the app
            NavigationView
            {
                // Set the initial view to GetStarted
                GetStarted()
       
            }
            // Use StackNavigationViewStyle for the NavigationView
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarBackButtonHidden()
            // Share the view models across the app as environment objects
            .environmentObject(viewModel)
            .environmentObject(medViewModel)
        }
    }
}
