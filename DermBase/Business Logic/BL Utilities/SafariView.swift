//
//  SafariView.swift
//  DermBase
//
//  Created by Farjad on 29/04/2023.
//

import SwiftUI
import UIKit
import SafariServices


struct SafariView: UIViewControllerRepresentable
{
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController
    {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
    }
}
