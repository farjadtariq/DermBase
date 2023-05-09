// LoginView.swift
// DermBase
//
// LoginView displays a sign-in form for users to log in to the app.
// Created by Farjad on 08/04/2023.

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    // State variables for email, password, and password visibility
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    
    // Environment objects for view model and medications view model
    @EnvironmentObject var viewModel: AppViewModel
    @EnvironmentObject var medViewModel: MedicationsViewModel
    
    var body: some View
    {
        // Check if the user is signed in
        if viewModel.signedIn
        {
            // If signed in, navigate to HomeView
            HomeView()
        }
        else
        {
            // If not signed in, display content
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
                formContent
                Spacer()
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.top)
        }
    }
    
    var formContent: some View
    {
        VStack(spacing: 16)
        {
            LogoView()
            SignInPromptView()
            EmailInputView(email: $email)
            PasswordInputView(title: "Password",password: $password, showPassword: $showPassword)
            SignInButtonView(email: email, password: password, viewModel: viewModel)
        }
        .padding()
    }
}


struct LoginView_Previews: PreviewProvider
{
    static var previews: some View
    {
        LoginView()
    }
}

