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
    
    private func homeView(player: SailboatRadioPlayer) -> HomeView {
        let presenter = HomePresenter(player: player, service: FavouriteStationService())
        let homeView = HomeView(model: HomeViewModel(), presenter: presenter, playerView: player.view)
        presenter.view = homeView
        
        return homeView
    }
    
    var body: some View {
        TabView {
            if let player = player {
                homeView(player: player)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                BrowseView(playerView: player.view)
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
        }
    }
    
    init(player: SailboatRadioPlayer) {
        self.player = player
    }
}
