//
//  LoginView.swift
//  DermBase
//
//  Created by Farjad on 08/04/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isBackButtonActive = false
    @State private var isRegisterViewActive = false
    
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
                        GetStarted()
                    }

                    Spacer()
                    Text("Log in")
                        .font(.title)
                        .foregroundColor(Color(hex: "E37825"))
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .background(Color(hex: "1C3968"))
                .ignoresSafeArea(.all)
                
                VStack(spacing: 16) {
                    Image("LogoWBg") // Add your logo image here
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 100)
                    
                    VStack {
                        Text("Sign In")
                            .font(.title)
                            .foregroundColor(Color(hex: "1C3968"))
                        
                        HStack {
                            Text("Don't have an account?")
                                .foregroundColor(.gray)
                            Button(action: {isRegisterViewActive = true})
                            {
                                Text("Register")
                                    .foregroundColor(Color(hex: "1C3968"))
                            }
                            .sheet(isPresented: $isRegisterViewActive) {
                                RegistrationView()
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
                        DermButton(title: "Sign In")
                        
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


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
