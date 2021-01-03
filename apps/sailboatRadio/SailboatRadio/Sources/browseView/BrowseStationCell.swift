//
//  BrowseStationCell.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/3/21.
//  Copyright © 2021 SailboatDevelopment, Inc. All rights reserved.
//

import SwiftUI

struct BrowseStationCell: View {
    
    let station: BrowseStationViewModel
    
    var body: some View {
        Text("\(station.title)")
    }
    
}

struct BrowseStationViewModel {
    var id: String
    var title: String
    var descr: String
    var genre: String
    var audioUrl: URL
    var imageUrl: URL?
}
