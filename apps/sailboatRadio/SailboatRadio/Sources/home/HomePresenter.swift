//
//  HomePresenter.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/6/21.
//  Copyright © 2021 Sailboat Technologies, Inc. All rights reserved.
//

import Foundation
import SailboatMedia

final class HomePresenter: HomePresenterProtocol {
    
    private weak var player: SailboatRadioPlayer?
    private let service: RadioStationService
    
    var view: HomeView?
    
    private func viewModel(from dbModel: RadioStation) -> FavoriteStationViewModel {
        return FavoriteStationViewModel(id: dbModel.id,
                                        name: dbModel.name,
                                        homepage: dbModel.homepage,
                                        audioUrl: dbModel.audioUrl,
                                        iconUrl: dbModel.iconUrl)
    }
    
    private func load(station: FavoriteStationViewModel) {
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
            self.view?.model.stations = stations.map { self.viewModel(from: $0) }
        }
    }
    
    func stationTapped(station: FavoriteStationViewModel) {
        load(station: station)
        player?.play()
    }
    
    init(player: SailboatRadioPlayer, service: RadioStationService) {
        self.player = player
        self.service = service
    }
    
}

protocol HomePresenterProtocol: AnyObject {
    func load()
    func stationTapped(station: FavoriteStationViewModel)
}
