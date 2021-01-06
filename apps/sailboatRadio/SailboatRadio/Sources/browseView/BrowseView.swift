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
    var model: BrowseViewModel
    
    var presenter: BrowsePresenterProtocol
    
    var playerView: SailboatRadioPlayerView
    
    private var stationList: some View {
        ScrollView {
            ForEach(model.stations, id: \.id) { station in
                BrowseStationCell(station: station)
                    .onTapGesture {
                        presenter.stationTapped(station: station)
                    }
            }.padding(.horizontal, 3)
        }
    }
    
    var body: some View {
        Group {
            VStack {
                stationList
                playerView
            }.onAppear {
                presenter.load()
            }
        }
    }
    
}

final class BrowseViewModel: ObservableObject {
    @Published
    var stations = [BrowseStationViewModel]()
}
