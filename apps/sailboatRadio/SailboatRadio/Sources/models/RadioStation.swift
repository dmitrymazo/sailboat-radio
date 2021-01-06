//
//  RadioStation.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/3/21.
//  Copyright © 2021 SailboatDevelopment, Inc. All rights reserved.
//

import Foundation

struct RadioStation: DatabaseEntity {
    var id: String
    var name: String
    var homepage: String?
    var country: String
    var audioUrl: URL
    var iconUrl: URL?
}

protocol DatabaseEntity: Hashable, Identifiable {
    var id: String { get set}
}
