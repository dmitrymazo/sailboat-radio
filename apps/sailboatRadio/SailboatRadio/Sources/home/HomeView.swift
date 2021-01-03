//
//  HomeView.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/2/21.
//

import SwiftUI
import SailboatMedia

struct HomeView: View {
    
    private struct Constants {
        static let numberOfColumns = 4
    }
    
    @ObservedObject
    private var service = FavouriteViewService()
    
    private weak var player: SailboatRadioPlayer?
    
    private var stationList: some View {
        ScrollView {
            ForEach(ArrayBuilder.getMatrix(from: service.stations, numberOfColumns: Constants.numberOfColumns)
                    , id: \.self) { row in
                HStack(spacing: 3) {
                    ForEach(row, id: \.id) { dbModel in
                        let station = viewModel(from: dbModel)
                        FavoriteStationCell(station: station)
                            .onTapGesture {
                                load(station: station)
                                player?.play()
                            }
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
                    player?.view
                }
            } else {
                Text("Loading...")
            }
        }.onAppear {
            service.load()
        }
    }
    
    private func viewModel(from dbModel: RadioStation) -> FavoriteStationViewModel {
        return FavoriteStationViewModel(id: dbModel.id,
                                        title: dbModel.title,
                                        descr: dbModel.descr,
                                        genre: "1111",
                                        audioUrl: dbModel.audioUrl,
                                        imageUrl: dbModel.imageUrl)
    }
    
    private func load(station: FavoriteStationViewModel) {
        try? player?.load(url: station.audioUrl)
    }
    
    init(player: SailboatRadioPlayer) {
        self.player = player
    }
    
}
