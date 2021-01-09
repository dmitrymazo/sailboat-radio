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
        let view = HomeView(model: HomeViewModel(), presenter: presenter, playerView: player.view)
        presenter.view = view
        
        return view
    }
    
    private func browseView(player: SailboatRadioPlayer) -> BrowseView {
        let router = NetworkRouter()
        let presenter = BrowsePresenter(player: player, service: BrowseStationService(router: router))
        let view = BrowseView(model: BrowseViewModel(), presenter: presenter, playerView: player.view)
        presenter.view = view
        
        return view
    }
    
    var body: some View {
        TabView {
            if let player = player {
                homeView(player: player)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                browseView(player: player)
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
