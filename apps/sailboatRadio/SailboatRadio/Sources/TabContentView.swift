//
//  TabContentView.swift.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/2/21.
//

import SwiftUI
import SailboatMedia

struct TabContentView: View {
    
    private weak var player: SailboatRadioPlayer?
    
    var body: some View {
        TabView {
            if let player = player {
                HomeView(player: player)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                BrowseView(player: player)
                    .tabItem {
                        Image(systemName: "magnifyingglass.circle.fill")
                        Text("Browse")
                    }
                AboutView()
                    .tabItem {
                        Image(systemName: "person.circle")
                        Text("About")
                    }
            }
        }.onAppear {
            try? player?.load(url: "https://0n-country.radionetz.de/0n-country.aac")
        }
    }
    
    init(player: SailboatRadioPlayer) {
        self.player = player
    }
}
