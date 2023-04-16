//
//  RegistrationView.swift
//  DermBase
//
//  Created by Farjad on 08/04/2023.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email: String = ""
    @State private var password: String = ""
   
    var body: some View
    {
        NavigationView
        {
            CustomNavigationBar(title: "Register")
            {
                VStack
                {
                    VStack(spacing: 16)
                    {
                        Image("LogoWBg")
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal, 70)
                        
                        VStack
                        {
                            Text("Sign Up")
                                .font(.title)
                                .foregroundColor(Color(hex: "1C3968"))
                                .multilineTextAlignment(.leading)
                            
                            HStack
                            {
                                Text("Already have an account?")
                                    .foregroundColor(.gray)
                                
                                NavigationLink(destination: LoginView())
                                {
                                    Text("Login")
                                        .foregroundColor(Color(hex: "1C3968"))
                                }
                                
                            }
                        }
                        
                        TextField("Email", text: $email)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                        
                        
                        NavigationLink(destination: LoginView())
                        {
                            DermButton(title: "Sign Up")
                        }
                        
                        
                    }
                    .padding()
                    Spacer()
                }
                .background(Color.white)
                .edgesIgnoringSafeArea(.top)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct RegistrationView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RegistrationView()
    }
}
