//
//  BrowseView.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/2/21.
//

import SwiftUI
import SailboatMedia

struct BrowseView: View {
    
    @ObservedObject
    private var service = BrowseViewService()
    
    var playerView: SailboatRadioPlayerView
    
//    private weak var player: SailboatRadioPlayer?
    
    private var stationList: some View {
        ScrollView {
            ForEach(service.stations) { dbModel in
                HStack(spacing: 3) {
                    let station = viewModel(from: dbModel)
                    BrowseStationCell(station: station)
                        .onTapGesture {
//                            load(station: station)
//                            player?.play()
                        }
                }
            }.padding(.horizontal, 3)
        }
    }
    
    var body: some View {
        Group {
            if service.isLoaded {
                VStack {
                    stationList
                    playerView
                }
            } else {
                Text("Loading...")
            }
        }.onAppear {
            service.load()
        }
    }
    
    private func viewModel(from dbModel: RadioStation) -> BrowseStationViewModel {
        return BrowseStationViewModel(id: dbModel.id,
                                      title: dbModel.title,
                                      descr: dbModel.descr,
                                      genre: "222",
                                      audioUrl: dbModel.audioUrl,
                                      imageUrl: dbModel.imageUrl)
    }
    
//    private func load(station: BrowseStationViewModel) {
//        let item = RadioStationItem(title: station.title,
//                                    descr: station.descr,
//                                    audioUrl: station.audioUrl,
//                                    imageUrl: station.imageUrl)
//        try? player?.load(station: item)
//    }
    
    init(playerView: SailboatRadioPlayerView) {
//        self.player = player
        self.playerView = playerView
    }
    
}
