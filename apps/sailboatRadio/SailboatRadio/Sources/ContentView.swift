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
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            AboutView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("About")
                }
        }
    }
}
