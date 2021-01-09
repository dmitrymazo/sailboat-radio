//
//  RadioStationService.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/3/21.
//  Copyright © 2021 SailboatDevelopment, Inc. All rights reserved.
//

import Foundation

final class BrowseStationService: RadioStationService {
    
    static let endpoint = "https://nl1.api.radio-browser.info"
    private static let format = "json"
    static let limit = 30
    
    private let router: Router
    
    private func getList(offset: Int, searchTerm: String?, searchValue: String?, completion: @escaping ([RadioStation]) -> Void) {
        var search = ""
        if let searchTerm = searchTerm
           , let searchValue = searchValue {
            search = "/\(searchTerm)/\(searchValue)"
        }
        
        let urlString = "\(Self.endpoint)/\(Self.format)/stations\(search)?limit=\(Self.limit)"
        
        guard let url = URL(string: urlString) else { return }
        
        router.create(for: url) { data, response, error in
            if let data = data
               , error == nil {
                do {
                    let decodedStations = try JSONDecoder().decode([RadioStationDBModel].self, from: data)
                    
                    let stations: [RadioStation] = decodedStations.map {
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
                    // TO DO: Result.error
                    completion([])
                }
            } else {
                print(error)
                // TO DO: Result.error
                completion([])
            }
        }
        
        router.resume()
    }
    
    func getAll(offset: Int, completion: @escaping ([RadioStation]) -> Void) {
        getList(offset: offset, searchTerm: nil, searchValue: nil, completion: completion)
    }
    
    func getAllByCountry(offset: Int, searchValue: String?, completion: @escaping ([RadioStation]) -> Void) {
        getList(offset: offset, searchTerm: "bycountryexact", searchValue: searchValue, completion: completion)
    }
    
    init(router: Router) {
        self.router = router
    }
    
    deinit {
        router.cancel()
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
