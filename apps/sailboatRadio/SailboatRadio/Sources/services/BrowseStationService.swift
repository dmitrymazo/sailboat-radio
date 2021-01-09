//
//  RadioStationService.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/3/21.
//  Copyright © 2021 SailboatDevelopment, Inc. All rights reserved.
//

import Foundation

class BrowseStationService: RadioStationService {
    
    static let endpoint = "https://nl1.api.radio-browser.info"
    private static let format = "json"
    private static let limit = 2
    open var searchTerm: String? {
        ""
    }
    
    private let router: Router
    
    func getList(offset: Int, searchValue: String?, completion: @escaping ([RadioStation]) -> Void) {
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
    
    init(router: Router) {
        self.router = router
    }
    
    deinit {
        router.cancel()
    }
}

final class BrowseByCountryService: BrowseStationService {
    override var searchTerm: String {
        "bycountryexact"
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
