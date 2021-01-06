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
    var model: HomeViewModel
    
    var presenter: HomePresenterProtocol
    
    var playerView: SailboatRadioPlayerView
    
    private var stationList: some View {
        ScrollView {
            ForEach(ArrayBuilder.getMatrix(from: model.stations, numberOfColumns: Constants.numberOfColumns)
                    , id: \.self) { row in
                HStack(spacing: 3) {
                    ForEach(row, id: \.id) { station in
                        FavoriteStationCell(station: station)
                            .onTapGesture {
                                presenter.stationTapped(station: station)
                            }
                    }
                }
            }.padding(.horizontal, 3)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                stationList
                playerView
            }.onAppear {
                presenter.load()
            }.navigationBarTitle("Favourites", displayMode: .inline)
        }
    }
    
}

final class HomeViewModel: ObservableObject {
    @Published
    var stations = [FavoriteStationViewModel]()
}
