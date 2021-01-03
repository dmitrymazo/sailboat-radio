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
                         descr: "rvrv",
                         genre: .pop,
                         audioUrl: URL(string: "https://masima.rastream.com/masima-pramborsjakarta?awparams=stationid:masima-pramborsjakarta")!,
                         imageUrl: nil),
            RadioStation(id: "enynyen",
                         title: "80sradio.co.uk",
                         descr: "ethert",
                         genre: .pop,
                         audioUrl: URL(string: "https://18193.live.streamtheworld.com/SAM03AAC226_SC")!,
                         imageUrl: nil),
            RadioStation(id: "dnnytyn",
                         title: "977 Hits",
                         descr: "",
                         genre: .pop,
                         audioUrl: URL(string: "https://19353.live.streamtheworld.com/977_HITS_SC")!,
                         imageUrl: nil),
            RadioStation(id: "therthern",
                         title: "977 SMOOJAZZ",
                         descr: "",
                         genre: .pop,
                         audioUrl: URL(string: "https://18853.live.streamtheworld.com/977_SMOOJAZZ_SC")!,
                         imageUrl: nil),
            RadioStation(id: "hh56h56h",
                         title: "Calm radio",
                         descr: "",
                         genre: .pop,
                         audioUrl: URL(string: "https://streams.calmradio.com:4428/stream")!,
                         imageUrl: nil)
        ]
        
        completion(stations)
    }
    
}
