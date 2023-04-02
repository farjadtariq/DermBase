//
//  ContentView.swift
//  DermBase
//
//  Created by Farjad on 02/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(hex: "1C3968")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image("dermbase_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 40)
                Text("Welcome to DermBase")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                Button(action: {
                    // handle button action
                }) {
                    Text("Get Started")
                        .foregroundColor(Color(hex: "1C3968"))
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding()
                }
                .background(Color(hex: "E37825"))
                .cornerRadius(10)
                .padding(.horizontal, 50)
                Spacer()
            }
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        self.init(
            .sRGB,
            red: Double((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: Double((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgbValue & 0x0000FF) / 255.0,
            opacity: 1.0
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
