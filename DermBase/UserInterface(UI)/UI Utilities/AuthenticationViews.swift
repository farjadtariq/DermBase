//
//  PasswordView.swift
//  DermBase
//
//  Sub-Views used in LoginView and RegistrationView
//
//  Created by Farjad on 01/05/2023.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Image("LogoWBg")
            .resizable()
            .scaledToFit()
            .padding(.horizontal, 70)
    }
}

struct SignInPromptView: View {
    var body: some View {
        VStack {
            Text("Sign In")
                .font(.title)
                .foregroundColor(Color(hex: "1C3968"))

            HStack {
                Text("Don't have an account?")
                    .foregroundColor(.gray)

                NavigationLink(destination: RegistrationView()) {
                    Text("Register")
                        .foregroundColor(Color(hex: "1C3968"))
                }
            }
        }
    }
}

struct SignUpPromptView: View {
    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.title)
                .foregroundColor(Color(hex: "1C3968"))
            
            HStack {
                Text("Already have an account?")
                    .foregroundColor(.gray)
                
                NavigationLink(destination: LoginView()) {
                    Text("Login")
                        .foregroundColor(Color(hex: "1C3968"))
                }
            }
        }
    }
}

struct NameInputFieldsView: View {
    @Binding var firstName: String
    @Binding var lastName: String

    var body: some View {
        HStack {
            HStack {
                Image(systemName: "person")
                    .foregroundColor(Color(hex: "1C3968"))
                TextField("First Name", text: $firstName)
            }
            .padding()
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(hex: "1C3968"), lineWidth: 2)
            )
            
            HStack {
                Image(systemName: "person")
                    .foregroundColor(Color(hex: "1C3968"))
                TextField("Last Name", text: $lastName)
            }
            .padding()
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(hex: "1C3968"), lineWidth: 2)
            )
        }
    }
}

struct NpiInputView: View {
    @Binding var npi: String

    var body: some View {
        HStack {
            Image(systemName: "number")
                .foregroundColor(Color(hex: "1C3968"))
            TextField("NPI Number", text: $npi)

            Spacer()

            if (npi.count != 0) {
                Image(systemName: isValidNPI(npi: npi) ? "checkmark" : "xmark")
                    .fontWeight(.bold)
                    .foregroundColor(isValidNPI(npi: npi) ? .green : .red)
            }
        }
        .padding()
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(hex: "1C3968"), lineWidth: 2)
        )
    }
}

struct EmailInputView: View {
    @Binding var email: String

    var body: some View {
        HStack {
            Image(systemName: "mail")
                .foregroundColor(Color(hex: "1C3968"))
            TextField("Email", text: $email)

            Spacer()

            if (email.count != 0) {
                Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                    .fontWeight(.bold)
                    .foregroundColor(email.isValidEmail() ? .green : .red)
            }
        }
        .padding()
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(hex: "1C3968"), lineWidth: 2)
        )
    }
}

struct PasswordView: View {
    var title: String
    @Binding var password: String
    @Binding var showPassword: Bool
    
    var body: some View {
        HStack {
            if showPassword {
                TextField(title, text: $password)
            } else {
                SecureField(title, text: $password)
            }
            Button(action: {
                self.showPassword.toggle()
            }) {
                if (password.count != 0)
                {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .foregroundColor(Color(hex: "1C3968"))
                }
            }
        }
    }
}


struct PasswordInputView: View {
    var title: String
    @Binding var password: String
    @Binding var showPassword: Bool
    @Binding var isPasswordTapped: Bool

    var body: some View {
        HStack {
            Image(systemName: "lock")
                .foregroundColor(Color(hex: "1C3968"))
            PasswordView(title: title, password: $password, showPassword: $showPassword)
                .onTapGesture {
                    isPasswordTapped = true
                }
            Spacer()

            if (password.count != 0) {
                Image(systemName: isValidPassword(password: password) ? "checkmark" : "xmark")
                    .fontWeight(.bold)
                    .foregroundColor(isValidPassword(password: password) ? .green : .red)
            }
        }
        .padding()
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(hex: "1C3968"), lineWidth: 2)
        )
        .onChange(of: password) { _ in
            if isValidPassword(password: password) {
                isPasswordTapped = false
            }
        }
    }
}

struct PasswordRequirementsAlert: View {
    var body: some View {
        Text("Password must include: 1 uppercase, 1 lowercase, 1 numeric, and 1 special character.")
            .foregroundColor(.red)
            .font(.caption)
            .fixedSize(horizontal: false, vertical: true)
    }
}
struct PasswordMatchAlert: View {
    var body: some View {
        Text("Both passwords must match.")
            .foregroundColor(.red)
            .font(.caption)
    }
}


struct SignInButtonView: View {
    var email: String
    var password: String
    @ObservedObject var viewModel: AppViewModel
    @State private var errorMessage: String = ""

    var body: some View {
        Button {
            guard !email.isEmpty, !password.isEmpty else {
                return
            }
            viewModel.signIn(email: email, password: password) { error in
                if let error = error {
                    errorMessage = error.localizedDescription
                } else {
                    errorMessage = ""
                }
            }
        } label: {
            DermButton(title: "Sign In")
        }
        
        if !errorMessage.isEmpty {
            Text(errorMessage)
                .foregroundColor(.red)
                .font(.caption)
        }
    }
}

struct CheckboxToggleStyle: ToggleStyle
{
    
    func makeBody(configuration: Self.Configuration) -> some View
    {
        HStack
        {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(configuration.isOn ? Color(hex: "1C3968") : .gray)
                .onTapGesture
                {
                    configuration.isOn.toggle()
                }
            configuration.label
        }
    }
}

struct SignUpButtonView: View {
    var email: String
    var password: String
    var firstName: String
    var lastName: String
    var npi: String
    @ObservedObject var viewModel: AppViewModel
    @Binding var presentationMode: PresentationMode
    var isCheckboxChecked: Bool
    @Binding var showError: Bool
    
    var body: some View {
        Button {
            guard !email.isEmpty, !password.isEmpty else {
                return
            }
            if isCheckboxChecked
            {
                viewModel.signUp(email: email, password: password, firstName: firstName, lastName: lastName, npi: npi)
                {
                    //Handles successful sign up, if successful navigates to Login Page for login
                    error in
                    if let error = error
                    {
                        print("Sign Up Error: \(error.localizedDescription)")
                    }
                }
                showError = false
            }
            else
            {
                print("Privacy Policy and Terms and Conditions not agreed to.")
                showError = true
            }
        } label: {
            DermButton(title: "Sign Up")
        }
    }
}

