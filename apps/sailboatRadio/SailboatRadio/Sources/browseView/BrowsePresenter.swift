//
//  BrowsePresenter.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/6/21.
//  Copyright © 2021 Sailboat Technologies, Inc. All rights reserved.
//

import Foundation
import SailboatMedia

final class BrowsePresenter: BrowsePresenterProtocol {
    
    private weak var player: SailboatRadioPlayer?    
    private let service: RadioStationService
    
    var view: BrowseView?
    
    private func viewModel(from dbModel: RadioStation) -> BrowseStationViewModel {
        return BrowseStationViewModel(id: dbModel.id,
                                      name: dbModel.name,
                                      homepage: dbModel.homepage,
                                      audioUrl: dbModel.audioUrl,
                                      iconUrl: dbModel.iconUrl)
    }
    
    private func load(station: BrowseStationViewModel) {
        let item = RadioStationItem(id: station.id,
                                    name: station.name,
                                    homepage: station.homepage,
                                    audioUrl: station.audioUrl,
                                    iconUrl: station.iconUrl)
        try? player?.load(station: item)
    }
    
    func load() {
        service.getList { [weak self] stations in
            guard let self = self else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.view?.model.stations = stations.map { self.viewModel(from: $0) }
            }
        }
    }
    
    func stationTapped(station: BrowseStationViewModel) {
        load(station: station)
        player?.play()
    }
    
    init(player: SailboatRadioPlayer, service: RadioStationService) {
        self.player = player
        self.service = service
    }
    
}

protocol BrowsePresenterProtocol {
    func load()
    func stationTapped(station: BrowseStationViewModel)
}
