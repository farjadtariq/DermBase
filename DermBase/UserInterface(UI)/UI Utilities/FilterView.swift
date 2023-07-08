//
//  FilterView.swift
//  DermBase
//
//  Created by Farjad on 09/06/2023.
//

import SwiftUI

struct FilterBar: View {
    @Binding var showFilterSheet: Bool

    var body: some View {
        Button(action: {
            showFilterSheet.toggle()
        }) {
            HStack {
                Text("Filters")
                Spacer()
                Image(systemName: "slider.horizontal.3")
            }
            .foregroundColor(.primary)
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        .background(Color(UIColor.systemBackground))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(hex: "E37825"), lineWidth: 2)
        )
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
}

struct FilterSheet: View {
    @Binding var showSheet: Bool
    @Binding var selectedYearRange: String
    @Binding var suitableForChildren: Bool
    @Binding var suitableForPregnancy: Bool
    @Binding var suitableForBreastfeeding: Bool
    @Binding var isInjection: Bool
    @Binding var isTablet: Bool
    @Binding var isTopical: Bool

    let yearRanges = ["All", "1995-1999", "2000-2004", "2005-2009", "2010-2014", "2015-2019", "2020-Present"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Year")) {
                    Picker("Year", selection: $selectedYearRange) {
                        ForEach(yearRanges, id: \.self) { yearRange in
                            Text(yearRange).tag(yearRange)
                        }
                    }
                }

                Section(header: Text("Special Cases")) {
                    Toggle(isOn: $suitableForChildren) {
                        Text("Suitable for children")
                    }
                    Toggle(isOn: $suitableForPregnancy) {
                        Text("Suitable for pregnancy")
                    }
                    Toggle(isOn: $suitableForBreastfeeding) {
                        Text("Suitable for breastfeeding")
                    }
                }
                
                Section(header: Text("Mode of Delivery")) {
                    Toggle(isOn: $isInjection) {
                        Text("💉 Injection")
                    }
                    Toggle(isOn: $isTablet) {
                        Text("💊 Pill")
                    }
                    Toggle(isOn: $isTopical) {
                        Text("🧴 Cream")
                    }
                }
            }
            .navigationBarTitle("Filters", displayMode: .inline)
            .navigationBarItems(trailing: Button("Apply") {
                showSheet = false
            })
        }
        .presentationDetents([.height(525)])
    }
}
