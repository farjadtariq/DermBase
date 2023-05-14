//
//  AccountInformationView.swift
//  DermBase
//
//  Created by Farjad on 01/05/2023.
//

import SwiftUI

struct AccountInformationView: View
{
    @EnvironmentObject var appViewModel: AppViewModel

    @State private var userData: UserData? = nil
    @State private var showErrorAlert = false
    @State private var errorMessage = ""
    @State private var currentAlert: AlertType? = nil
    @State private var showAlert = false

    
    var body: some View
    {
        content
            .navigationBarBackButtonHidden()
            .onAppear
            {
                fetchUserData()
            }
            .alert(isPresented: $showAlert) {
                switch currentAlert {
                case .error:
                    return Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                case .passwordResetSuccess:
                    return Alert(title: Text("Password reset email sent successfully"),
                                 message: Text("Please check your email for a link to reset your password."),
                                 dismissButton: .default(Text("OK")) {
                                     appViewModel.passwordReset = false
                                 })
                case .accountDeletedSuccess:
                    return Alert(title: Text("Account deleted successfully"),
                                 message: Text("Your account has been deleted, you will no longer be able to access DermBase."),
                                 dismissButton: .default(Text("OK")) {
                                     appViewModel.accountDeleted = false
                                 })
                case .none:
                    return Alert(title: Text(""))
                }
            }
    }
    
    var content: some View
    {
        CustomNavigationBar(title: "Account Information")
        {
            ZStack
            {
                Color(UIColor.systemBackground)
                    .ignoresSafeArea(.all)
                
                VStack(spacing: 15)
                {
                    if let userData = userData
                    {
                        // Group to handle Vstacks for displaying User Data
                        Group
                        {
                            VStack(alignment: .leading) {
                                Text("First Name")
                                    .font(.subheadline)
                                    .foregroundColor(Color(hex: "E37825"))
                                Text(userData.firstName)
                                    .font(.body)
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Last Name")
                                    .font(.subheadline)
                                    .foregroundColor(Color(hex: "E37825"))
                                Text(userData.lastName)
                                    .font(.body)
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Email")
                                    .font(.subheadline)
                                    .foregroundColor(Color(hex: "E37825"))
                                Text(userData.email)
                                    .font(.body)
                            }
                            
                            VStack(alignment: .leading) {
                                Text("NPI Number")
                                    .font(.subheadline)
                                    .foregroundColor(Color(hex: "E37825"))
                                Text(userData.npi)
                                    .font(.body)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    }
                    
                    // Button for reset password
                    Button(action: {
                        resetPassword()
                    }) {
                        Text("Reset Password")
                            .foregroundColor(Color(hex: "1C3968"))
                            .padding(.top)
                            .cornerRadius(8)
                    }
                    
                    // Button for delete account
                    Button(action: {
                        deleteAccount()
                    }) {
                        Text("Delete Account")
                            .foregroundColor(Color.red)
                            .cornerRadius(8)
                    }
                    
                    Spacer()
                }
                .padding(.top)
            }
            .alert(isPresented: $showErrorAlert)
            {
                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    private func fetchUserData()
    {
        appViewModel.fetchUserData { result in
            switch result {
            case .success(let userData):
                self.userData = userData
            case .failure(let error):
                showErrorAlert = true
                errorMessage = error.localizedDescription
            }
        }
    }
    
    private func resetPassword()
    {
        if let email = userData?.email
        {
            appViewModel.resetPassword(email: email) { error in
                if let error = error
                {
                    print("Error sending password reset email: \(error.localizedDescription)")
                    errorMessage = error.localizedDescription
                    currentAlert = .error
                }
                else
                {
                    print("Password reset email sent successfully.")
                    currentAlert = .passwordResetSuccess
                    //appViewModel.passwordReset = true
                }
                showAlert = true
            }
        }
    }
        
    private func deleteAccount()
    {
        appViewModel.deleteAccount() { error in
            if let error = error
            {
                print("Error deleting account: \(error.localizedDescription)")
                errorMessage = error.localizedDescription
                currentAlert = .error
            }
            else
            {
                print("Account deleted successfully.")
                currentAlert = .accountDeletedSuccess
                //appViewModel.accountDeleted = true
                //showAlert = true
                //appViewModel.signOut()
            }
            showAlert = true
            appViewModel.signOut()
        }
    }
    
    enum AlertType
    {
        case error
        case passwordResetSuccess
        case accountDeletedSuccess
    }

}


struct AccountInformationView_Previews: PreviewProvider {
    static var previews: some View {
        AccountInformationView()
    }
}
