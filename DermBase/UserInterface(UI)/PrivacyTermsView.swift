//
//  PrivacyPolicyView.swift
//  DermBase
//
//  Created by Farjad on 01/05/2023.
//

import SwiftUI

struct PrivacyTermsView: View
{
    var body: some View
    {
        content
            .navigationBarBackButtonHidden()
    }
    
    var content: some View
    {
        CustomNavigationBar(title: "Privacy & Terms")
        {
            ZStack
            {
                Color(UIColor.systemBackground)
                    .ignoresSafeArea(.all)
                
                ScrollView
                {
                    ScrollViewReader { ScrollViewProxy in
                        VStack(alignment: .leading, spacing: 8)
                        {
                            Text("Privacy Policy and Terms and Conditions (T&C)")
                                .font(.title)
                                //.foregroundColor(Color.black)
                                .fontWeight(.bold)
                            Spacer()
                            
                            // T&C simplified
                            termsSimplified()
                            Group
                            {
                                Text("For the full Terms and Conditions, please click ")
                                    .font(.body)
                                    .fixedSize(horizontal: false, vertical: true)
                                Text("here.")
                                    .font(.body)
                                    .foregroundColor(Color.blue)
                                    .underline()
                                    .fixedSize(horizontal: false, vertical: true)
                                    .onTapGesture {
                                        ScrollViewProxy.scrollTo("T&C",  anchor: .top)
                                    }
                            }
                           // .foregroundColor(Color.black)
                            
                            // Privacy Policy simplified
                            privacyPolicySimplified()
                            Group
                            {
                                Text("For the full Privacy Policy, please click ")
                                    .font(.body)
                                    .fixedSize(horizontal: false, vertical: true)
                                Text("here.")
                                    .font(.body)
                                    .foregroundColor(Color.blue)
                                    .underline()
                                    .fixedSize(horizontal: false, vertical: true)
                                    .onTapGesture {
                                        ScrollViewProxy.scrollTo("privacyPolicy",  anchor: .top)
                                    }
                            }
                           // .foregroundColor(Color.black)
                            
                            // T&C detailed
                            Text("\nTerms and Conditions")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: "E37825"))
                                .id("T&C")
                            
                            termsDetailed()
                            
                            // Privacy Policy (Detailed)
                            Text("\nPrivacy Policy")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: "E37825"))
                                .id("privacyPolicy")
                            
                            privacyPolicyDetailed()
                            
                        }
                        .padding()
                    }
                }
                
                // Used to create a white space in the safe area
                // to create better scroll view
                VStack
                {
                    Spacer()
                    Rectangle()
                        .fill(Color(UIColor.systemBackground))
                        .frame(height: 10)
                        .edgesIgnoringSafeArea(.bottom)
                }
                .ignoresSafeArea(.all)
                
            }
        }
    }
}


                                     
struct PrivacyTermsView_Previews: PreviewProvider
{
    static var previews: some View
    {
        PrivacyTermsView()
    }
}
