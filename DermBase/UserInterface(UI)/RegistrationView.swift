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
    @State private var isBackButtonActive = false
    @State private var isLoginViewActive = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {isBackButtonActive = true}) {
                        Image(systemName: "arrow.backward")
                            .foregroundColor(Color(hex: "E37825"))
                            .padding()
                    }
                    .sheet(isPresented: $isBackButtonActive) {
                        LoginView()
                    }
                    Spacer()
                    Text("Register")
                        .font(.title)
                        .foregroundColor(Color(hex: "E37825"))
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
                .background(Color(hex: "1C3968"))
                
                VStack(spacing: 16) {
                    Image("LogoWBg") // Add your logo image here
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 100)
                    
                    VStack {
                        Text("Sign Up")
                            .font(.title)
                            .foregroundColor(Color(hex: "1C3968"))
                        
                        HStack {
                            Text("Already have an account?")
                                .foregroundColor(.gray)
                            Button(action: {isLoginViewActive = true})
                            {
                                Text("Login")
                                    .foregroundColor(Color(hex: "1C3968"))
                            }
                            .sheet(isPresented: $isLoginViewActive) {
                                LoginView()
                            }
                        }
                    }.multilineTextAlignment(.leading)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                    
                    Button(action: {
                        // Implement Sign In action here
                    }) {
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
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
