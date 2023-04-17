//
//  RegistrationView.swift
//  DermBase
//
//  Created by Farjad on 08/04/2023.
//

import SwiftUI
import FirebaseAuth

struct RegistrationView: View
{
    @State private var email: String = ""
    @State private var password: String = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View
    {
        NavigationView
        {
            if viewModel.signedIn
            {
                LoginView()
            }
            else
            {
                content
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear
        {
            viewModel.signedIn = viewModel.isSignedIn
        }
        
    }
    
    var content: some View
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
                    
                    HStack
                    {
                        Image(systemName: "mail")
                        TextField("Email", text: $email)
                        
                        Spacer()
                        
                        if (email.count != 0)
                        {
                            Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(email.isValidEmail() ? .green : .red)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    
                    HStack
                    {
                        Image(systemName: "lock")
                        SecureField("Password", text: $password)
                        
                        Spacer()
                        
                        if (password.count != 0)
                        {
                            Image(systemName: isValidPassword(password: password) ? "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(isValidPassword(password: password) ? .green : .red)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    
                    Button
                    {
                        guard !email.isEmpty, !password.isEmpty else
                        {
                            return
                        }
                        viewModel.signUp(email: email, password: password)
                    } label: {
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


struct RegistrationView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RegistrationView()
    }
}

