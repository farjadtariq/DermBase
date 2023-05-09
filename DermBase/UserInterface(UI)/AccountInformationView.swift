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
    
    var body: some View
    {
        content
            .navigationBarBackButtonHidden()
            .onAppear
            {
                fetchUserData()
            }
    }
    
    var content: some View
    {
        CustomNavigationBar(title: "Account Information")
        {
            ZStack
            {
                Color.white
                
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
            .ignoresSafeArea(.all)
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
                }
                else
                {
                    print("Password reset email sent successfully.")
                }
            }
        }
    }
        
    private func deleteAccount()
    {
        appViewModel.deleteAccount() { error in
            if let error = error
            {
                print("Error deleting account: \(error.localizedDescription)")
            }
            else
            {
                print("Account deleted successfully.")
                appViewModel.signOut()
            }
        }
    }
}


struct AccountInformationView_Previews: PreviewProvider {
    static var previews: some View {
        AccountInformationView()
    }
}
