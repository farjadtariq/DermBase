//
//  GetStartedView.swift
//  DermBase
//
//  Created by Farjad on 02/04/2023.
//

import SwiftUI

struct GetStarted: View {
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            Color(hex: "1C3968")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
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
                NavigationView {
                    ZStack{
                        Button(action: {isActive = true})
                        {
                            DermButton(title: "Get Started")
                        }
                        /*.sheet(isPresented: $isActive) {
                         LoginView()
                         }*/
                        
                        Spacer()
                        
                        NavigationLink("", destination: LoginView(), isActive: $isActive)
                            .opacity(0)
                    }
                }
               
                
            }
        }
    }
}


struct GetStarted_Previews: PreviewProvider {
    static var previews: some View {
        GetStarted()
    }
}


