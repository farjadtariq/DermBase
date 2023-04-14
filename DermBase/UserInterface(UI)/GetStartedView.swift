//
//  GetStartedView.swift
//  DermBase
//
//  Created by Farjad on 02/04/2023.
//

import SwiftUI

struct GetStarted: View
{
    var body: some View
    {
        NavigationView
        {
            ZStack
            {
                Color(hex: "1C3968")
                    .edgesIgnoringSafeArea(.all)
                
                //VStack holding the Logo, Welcome text and Get Started Button
                VStack
                {
                    Spacer()
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 390, height: 370)
                        .padding(.bottom, 50)
                        .padding(.top, -100)
                    
                    Text("Welcome to DermBase")
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top, -100)
                    
                    
                    NavigationLink(destination: LoginView())
                    {
                        DermButton(title: "Get Started")
                    }
                    
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}


struct GetStarted_Previews: PreviewProvider
{
    static var previews: some View
    {
        GetStarted()
    }
}


