//
//  DermButton.swift
//  DermBase
//
//  Created by Farjad on 08/04/2023.
//

import SwiftUI

struct DermButton: View
{
    var title: String
    
    var body: some View
    {
        Text(title)
            .frame(width: 200, height: 50)
            .background(Color(hex: "E37825"))
            .foregroundColor(Color(hex: "1C3968"))
            .font(.system(size: 20, weight: .semibold, design: .default))
            .buttonStyle(.bordered)
            .cornerRadius(10)
            .padding(.horizontal, 50)
    }
}
