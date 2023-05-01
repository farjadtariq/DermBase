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
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var gender: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showPassword: Bool = false
    @State private var showConfirmPassword: Bool = false
    
    @EnvironmentObject var viewModel: AppViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View
    {
        content
            .navigationBarBackButtonHidden()
            .alert(isPresented: $viewModel.signedUp) {
                Alert(title: Text("Sign Up Successful"),
                      message: Text("Please verify your email before signing in."),
                      dismissButton: .default(Text("OK")) {
                    viewModel.signedUp = false
                    self.presentationMode.wrappedValue.dismiss()
                })
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
                    
                    HStack {
                        TextField("First Name", text: $firstName)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        TextField("Last Name", text: $lastName)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                    
                    Menu {
                        Button(action: { gender = "Male" }) {
                            Text("Male")
                        }
                        Button(action: { gender = "Female" }) {
                            Text("Female")
                        }
                        Button(action: { gender = "I do not wish to identify" }) {
                            Text("I do not wish to identify")
                        }
                    } label: {
                        HStack {
                            Text(gender.isEmpty ? "Select Gender" : gender)
                                .foregroundColor(.gray)
                            Image(systemName: "chevron.down")
                                .foregroundColor(Color(hex: "1C3968"))
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    
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
                        PasswordView(title: "Password", password: $password, showPassword: $showPassword)
                        
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
                    
                    HStack {
                        Image(systemName: "lock")
                        PasswordView(title: "Confirm Password", password: $confirmPassword, showPassword: $showConfirmPassword)
                        //SecureField("Confirm Password", text: $confirmPassword)
                        
                        Spacer()
                        
                        if (confirmPassword.count != 0) {
                            Image(systemName: confirmPassword == password ? "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(confirmPassword == password ? .green : .red)
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
                        viewModel.signUp(email: email, password: password, firstName: firstName, lastName: lastName, gender: gender)
                        {
                            //Handles successful sign up, if successful navigates to Login Page for login
                            error in
                            if let error = error
                            {
                                print("Sign Up Error: \(error.localizedDescription)")
                            }
                        }
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

