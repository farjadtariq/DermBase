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
    // State variables
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var gender: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showPassword: Bool = false
    @State private var showConfirmPassword: Bool = false
    
    // Environment objects for view model and presentationMode
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
    
    // Main content view
    var content: some View
    {
        CustomNavigationBar(title: "Register")
        {
            VStack
            {
                formContent
                Spacer()
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.top)
        }
    }
        
    // Registration form content
    var formContent: some View
    {
        VStack(spacing: 16)
        {
            LogoView()
            SignUpPromptView()
            NameInputFieldsView(firstName: $firstName, lastName: $lastName)
            EmailInputView(email: $email)
            PasswordInputView(title: "Password", password: $password, showPassword: $showPassword)
            PasswordInputView(title: "Confirm Password", password: $confirmPassword, showPassword: $showConfirmPassword)
            SignUpButtonView(email: email, password: password, firstName: firstName, lastName: lastName, gender: gender, viewModel: viewModel, presentationMode: presentationMode)
        }
        .padding()
    }
}


struct RegistrationView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RegistrationView()
    }
}

