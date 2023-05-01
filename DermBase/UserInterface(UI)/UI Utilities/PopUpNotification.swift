//
//  PopUpNotification.swift
//  DermBase
//
//  Created by Farjad on 18/04/2023.
//

import SwiftUI

struct PopupView: View
{
    let text: String

    var body: some View
    {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .background(Color.black.opacity(0.8))
            .cornerRadius(8)
    }
}
