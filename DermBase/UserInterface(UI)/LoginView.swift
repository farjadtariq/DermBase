//
//  LoginView.swift
//  DermBase
//
//  Created by Farjad on 08/04/2023.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View
{
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    
    @EnvironmentObject var viewModel: AppViewModel
    @EnvironmentObject var medViewModel: MedicationsViewModel
    
    var body: some View
    {
        if viewModel.signedIn
        {
            MedicationsView()
                .environmentObject(medViewModel)
        }
        else
        {
            content
                .navigationBarBackButtonHidden()
                .alert(isPresented: $viewModel.emailNotVerified) {
                    Alert(title: Text("Email not verified"),
                          message: Text("Please verify your email before signing in."),
                          dismissButton: .default(Text("OK")) {
                        viewModel.emailNotVerified = false
                    })
                }
                .onAppear {
                    NotificationCenter.default.addObserver(viewModel, selector: #selector(AppViewModel.handleAppDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
                }
                .onDisappear {
                    NotificationCenter.default.removeObserver(viewModel, name: UIApplication.didBecomeActiveNotification, object: nil)
                }
        }
    }
    
    var content: some View
    {
        CustomNavigationBar(title: "Login")
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
                        Text("Sign In")
                            .font(.title)
                            .foregroundColor(Color(hex: "1C3968"))
                        
                        HStack
                        {
                            Text("Don't have an account?")
                                .foregroundColor(.gray)
                            
                            NavigationLink(destination: RegistrationView())
                            {
                                Text("Register")
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
                    
                    
                    Button
                    {
                        guard !email.isEmpty, !password.isEmpty else
                        {
                            return
                        }
                        viewModel.signIn(email: email, password: password)
                    } label: {
                        DermButton(title: "Sign In")
                    }
                    .onSubmit {
                        viewModel.signedIn = viewModel.isSignedIn
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




struct LoginView_Previews: PreviewProvider
{
    static var previews: some View
    {
        LoginView()
    }
}

