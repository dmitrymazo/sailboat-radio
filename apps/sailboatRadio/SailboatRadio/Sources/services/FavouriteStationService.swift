//
//  RadioStationService.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/3/21.
//  Copyright © 2021 SailboatDevelopment, Inc. All rights reserved.
//

import Foundation

final class FavouriteStationService {
    
    func getList(completion: @escaping ([RadioStation]) -> Void) {
        let stations: [RadioStation] = [
            RadioStation(id: "trbeberttbetb",
                         name: "Masima",
                         homepage: "radio",
                         country: "",
                         audioUrl: URL(string: "https://masima.rastream.com/masima-pramborsjakarta?awparams=stationid:masima-pramborsjakarta")!,
                         iconUrl: nil),
            RadioStation(id: "enynyen",
                         name: "80sradio.co.uk",
                         homepage: "radio",
                         country: "",
                         audioUrl: URL(string: "https://18193.live.streamtheworld.com/SAM03AAC226_SC")!,
                         iconUrl: nil),
            RadioStation(id: "dnnytyn",
                         name: "977 Hits",
                         homepage: "radio",
                         country: "",
                         audioUrl: URL(string: "https://19353.live.streamtheworld.com/977_HITS_SC")!,
                         iconUrl: nil),
            RadioStation(id: "therthern",
                         name: "977 SMOOJAZZ",
                         homepage: "",
                         country: "",
                         audioUrl: URL(string: "https://18853.live.streamtheworld.com/977_SMOOJAZZ_SC")!,
                         iconUrl: nil),
            RadioStation(id: "mtyumrntyn",
                         name: "Country",
                         homepage: "radio",
                         country: "",
                         audioUrl: URL(string: "https://0n-country.radionetz.de/0n-country.aac")!,
                         iconUrl: URL(string: "https://cdn.freelogovectors.net/wp-content/uploads/2015/06/shepherd.png")!),
        ]
        
        completion(stations)
    }
    
}
