//
//  RadioStationService.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/3/21.
//  Copyright © 2021 SailboatDevelopment, Inc. All rights reserved.
//

import Foundation

final class BrowseStationService: RadioStationService {
    
    private let url = URL(string: "http://95.179.139.106/json/stations/bycountryexact/austria")!
    
    private var task: URLSessionDataTask?
    
    func getList(completion: @escaping ([RadioStation]) -> Void) {
        task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let ttt = try JSONDecoder().decode([RadioStationDBModel].self, from: data)
                    
                    let stations: [RadioStation] = ttt.map {
                        RadioStation(id: $0.stationuuid,
                                     name: $0.name,
                                     homepage: $0.homepage,
                                     country: $0.country ?? "",
                                     audioUrl: URL(string: $0.url)!,
                                     iconUrl: URL(string: $0.favicon ?? ""))
                    }
                    
                    completion(stations)
                } catch let error {
                    print(error)
                }
            }
        }
        
        task?.resume()
    }
    
    deinit {
        task?.cancel()
    }
}

struct RadioStationDBModel: Decodable {
    var stationuuid: String
    var name: String
    var url: String
    var favicon: String?
    var country: String?
    var homepage: String?
}
