//
//  FavoriteStationCell.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/3/21.
//  Copyright © 2021 SailboatDevelopment, Inc. All rights reserved.
//

import SwiftUI

struct FavoriteStationCell: View {
    
    let station: FavoriteStationViewModel
    
    var body: some View {
        VStack {
            Text(station.title)
        }
    }
    
}

struct FavoriteStationViewModel {
    var id: String
    var title: String
    var descr: String
    var genre: String
    var audioUrl: URL
    var imageUrl: URL?
}
