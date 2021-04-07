//
//  SettingsView.swift
//  News
//
//  Created by benjamiin on 07/04/2021.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Display"),
                        footer: Text("System settings will override Dark mode and use the current device theme.")) {
                    Toggle(isOn: .constant(true), label: {
                        Text("Dark mode")
                    })
                    
                    Toggle(isOn: .constant(true), label: {
                        Text("Use system settings")
                    })
                }
                
                Section {
                    Link(destination: URL(string: Constants.twitter)!) {
                        Label("Follow me on Twitter @cbasje", systemImage: "link")
                    }
                    
                    Link(destination: URL(string: Constants.email)!) {
                        Label("Send me an email", systemImage: "envelope")
                    }
                    
                    Link(destination: URL(string: Constants.phone)!) {
                        Label("Call me", systemImage: "phone")
                    }
                }
                .foregroundColor(.blue)
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
