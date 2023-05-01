//
//  PasswordView.swift
//  DermBase
//
//  Created by Farjad on 01/05/2023.
//

import SwiftUI

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
