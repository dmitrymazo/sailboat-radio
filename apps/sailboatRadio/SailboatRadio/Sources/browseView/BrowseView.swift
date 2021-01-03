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
    
    private weak var player: SailboatRadioPlayer?
    
    private var stationList: some View {
        ScrollView {
            ForEach(service.stations) { item in
                HStack(spacing: 3) {
                    BrowseStationCell(station: viewModel(from: item))
                }
            }.padding(.horizontal, 3)
        }
    }
    
    var body: some View {
        Group {
            if service.isLoaded {
                VStack {
                    stationList
                    player?.view
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
                                      audioUrl: dbModel.audioUrl)
    }
    
    init(player: SailboatRadioPlayer) {
        self.player = player
    }
    
}
