//
//  RadioStation.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/3/21.
//  Copyright © 2021 SailboatDevelopment, Inc. All rights reserved.
//

import Foundation

struct RadioStation: DatabaseEntity {
    enum RadioStationGenre {
        case rock
        case pop
        case country
        case news
    }
    var id: String
    var title: String
    var descr: String
    var genre: RadioStationGenre
    var audioUrl: URL
    var imageUrl: URL?
}

protocol DatabaseEntity: Hashable, Identifiable {
    var id: String { get set}
}
