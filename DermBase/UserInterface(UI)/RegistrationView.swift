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
    @State private var npi: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showPassword: Bool = false
    @State private var showConfirmPassword: Bool = false
    @State private var isPasswordTapped: Bool = false
    @State private var isCheckboxChecked: Bool = false
    @State private var showError: Bool = false

    
    // Environment objects for view model and presentationMode
    @EnvironmentObject var viewModel: AppViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View
    {
        content
            .navigationBarBackButtonHidden()
            .alert(isPresented: $viewModel.signedUp) {
                Alert(title: Text("Sign Up Successful"),
                      message: Text("Please verify your account with the link sent to your email.\nMake sure to check spam/junk folders if email is not received directly in the inbox."),
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
                checkBox
                privacyTerms
                SignUpButtonView(email: email, password: password, firstName: firstName, lastName: lastName, npi: npi, viewModel: viewModel, presentationMode: presentationMode, isCheckboxChecked: isCheckboxChecked, showError: $showError)
                Spacer()
            }
            .background(Color(UIColor.systemBackground))
            .edgesIgnoringSafeArea(.top)
        }
    }
        
    // Registration form content
    var formContent: some View
    {
        VStack(spacing: 13)
        {
            LogoView()
            SignUpPromptView()
            NameInputFieldsView(firstName: $firstName, lastName: $lastName)
            NpiInputView(npi: $npi)
            EmailInputView(email: $email)
            PasswordInputView(title: "Password", password: $password, showPassword: $showPassword, isPasswordTapped: $isPasswordTapped)
            PasswordInputView(title: "Confirm Password", password: $confirmPassword, showPassword: $showConfirmPassword, isPasswordTapped: $isPasswordTapped)
            if isPasswordTapped {
                PasswordRequirementsAlert()
                PasswordMatchAlert()
            }
        }
        .padding()
    }
    
    // Checkbox for agreeing to the privacy policy and T&C
    var checkBox: some View
    {
        Toggle(isOn: $isCheckboxChecked)
        {
            Text("I have read and agree to the following:")
                .foregroundColor(showError && !isCheckboxChecked ? .red : .gray)
        }
        .toggleStyle(CheckboxToggleStyle())
    }
    
    // Link to privacy policy and terms and conditions
    var privacyTerms: some View
    {
        NavigationLink(destination: PrivacyTermsView())
        {
            Text("Terms and Conditions and Privacy Policy Agreement")
                .underline()
                .foregroundColor(Color(hex: "1C3968"))
        }
        .padding(.bottom)
    }
}

struct RegistrationView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RegistrationView()
    }
}

