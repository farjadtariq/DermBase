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
            TextField("First Name", text: $firstName)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            TextField("Last Name", text: $lastName)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
    }
}

struct EmailInputView: View {
    @Binding var email: String

    var body: some View {
        HStack {
            Image(systemName: "mail")
            TextField("Email", text: $email)

            Spacer()

            if (email.count != 0) {
                Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                    .fontWeight(.bold)
                    .foregroundColor(email.isValidEmail() ? .green : .red)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
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

    var body: some View {
        HStack {
            Image(systemName: "lock")
            PasswordView(title: title, password: $password, showPassword: $showPassword)
            Spacer()

            if (password.count != 0) {
                Image(systemName: isValidPassword(password: password) ? "checkmark" : "xmark")
                    .fontWeight(.bold)
                    .foregroundColor(isValidPassword(password: password) ? .green : .red)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct GenderMenuView: View {
    @Binding var gender: String

    var body: some View {
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
    }
}

struct SignInButtonView: View {
    var email: String
    var password: String
    @ObservedObject var viewModel: AppViewModel

    var body: some View {
        Button {
            guard !email.isEmpty, !password.isEmpty else {
                return
            }
            viewModel.signIn(email: email, password: password)
        } label: {
            DermButton(title: "Sign In")
        }
        /*
        .onSubmit {
            viewModel.signedIn = viewModel.isSignedIn
        }*/
    }
}

struct SignUpButtonView: View {
    var email: String
    var password: String
    var firstName: String
    var lastName: String
    var gender: String
    @ObservedObject var viewModel: AppViewModel
    @Binding var presentationMode: PresentationMode

    var body: some View {
        Button {
            guard !email.isEmpty, !password.isEmpty else {
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
}

