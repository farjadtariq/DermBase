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

    init()
    {
        FirebaseApp.configure()
    }
    
    var body: some Scene
    {
        WindowGroup
        {
            let viewModel = AppViewModel()
            
            GetStarted()
                .environmentObject(viewModel)
        }
    }
}
