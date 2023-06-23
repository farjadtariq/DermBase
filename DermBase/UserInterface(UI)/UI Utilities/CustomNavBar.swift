//
//  CustomNavigationBar.swift
//  DermBase
//
//  Created by Farjad on 13/04/2023.
//


import SwiftUI

struct CustomNavigationBar<Content: View>: View
{
    @Environment(\.presentationMode) var presentationMode

    let title: String
    let showBackButton: Bool
    let content: Content
    
    init(title: String, showBackButton: Bool = true, @ViewBuilder content: () -> Content)
    {
        self.title = title
        self.showBackButton = showBackButton
        self.content = content()
    }
    
    var body: some View
    {
        ZStack
        {
            Color(hex: "1C3968")
                .edgesIgnoringSafeArea(.all)
        
            VStack
            {
                HStack
                {
                    if showBackButton
                    {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color(hex: "E37825"))
                                .font(.system(size: 25, weight: .semibold))
                                .padding(.leading, 10)
                        })
                    }
                    Spacer()
                    if showBackButton
                    {
                        Text(title)
                            .foregroundColor(Color(hex: "E37825"))
                            .font(.title)
                            .bold()
                            .padding(.trailing, 20)
                    }
                    else
                    {
                        Text(title)
                            .foregroundColor(Color(hex: "E37825"))
                            .font(.title)
                            .bold()
                    }
                    Spacer()
                }
                content
            }
        }
    }
}


