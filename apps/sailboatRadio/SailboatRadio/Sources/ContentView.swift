//
//  ContentView.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/2/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            BrowseView()
                .tabItem {
                    Image(systemName: "phone.fill")
                    Text("Browse")
                }
            AboutView()
                .tabItem {
                    Image(systemName: "phone.fill")
                    Text("About")
                }
        }
    }
}
