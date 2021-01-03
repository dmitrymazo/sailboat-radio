//
//  RadioStationService.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/3/21.
//  Copyright © 2021 SailboatDevelopment, Inc. All rights reserved.
//

import Foundation

final class FavouriteStationService: RadioStationService {
    
    func getList(completion: ([RadioStation]) -> Void) {
        let stations = [
            RadioStation(id: "trbeberttbetb",
                         title: "Masima",
                         descr: "",
                         genre: .pop,
                         audioUrl: URL(string: "https://masima.rastream.com/masima-pramborsjakarta?awparams=stationid:masima-pramborsjakarta")!,
                         imageUrl: nil),
            RadioStation(id: "wrgbtebtr53btb",
                         title: "Country",
                         descr: "",
                         genre: .country,
                         audioUrl: URL(string: "https://0n-country.radionetz.de/0n-country.aac")!,
                         imageUrl: nil),
            RadioStation(id: "dnnytyn",
                         title: "19353",
                         descr: "",
                         genre: .pop,
                         audioUrl: URL(string: "https://19353.live.streamtheworld.com/977_HITS_SC")!,
                         imageUrl: nil),
            RadioStation(id: "therthern",
                         title: "18853",
                         descr: "",
                         genre: .pop,
                         audioUrl: URL(string: "https://18853.live.streamtheworld.com/977_SMOOJAZZ_SC")!,
                         imageUrl: nil),
            RadioStation(id: "therthern",
                         title: "18853",
                         descr: "",
                         genre: .pop,
                         audioUrl: URL(string: "https://18853.live.streamtheworld.com/977_SMOOJAZZ_SC")!,
                         imageUrl: nil)
        ]
        
        completion(stations)
    }
    
}
