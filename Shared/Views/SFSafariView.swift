//
//  SFSafariView.swift
//  News
//
//  Created by benjamiin on 07/04/2021.
//

import SwiftUI
import SafariServices

struct SFSafariView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController
    
    let url: URL
    let color: Color
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let vc = SFSafariViewController(url: url)
        vc.preferredControlTintColor = UIColor(color)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        uiViewController.preferredControlTintColor = UIColor(color)
    }
}

struct SFSafariView_Previews: PreviewProvider {
    static var previews: some View {
        SFSafariView(url: URL(string: Constants.twitter)!, color: .red)
    }
}
