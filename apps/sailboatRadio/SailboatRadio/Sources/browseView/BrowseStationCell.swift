//
//  BrowseStationCell.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/3/21.
//  Copyright © 2021 SailboatDevelopment, Inc. All rights reserved.
//

import SwiftUI
import SailboatMedia

struct BrowseStationCell: View {
    
    private struct Constants {
        static let size: CGFloat = 60
    }
    
    @ObservedObject
    private var service = ImageLoader()
    
    private var favoriteButton = Image(systemName: "star")
    
    private var mainView: some View {
        HStack(spacing: 10) {
            stationImage
                .frame(width: Constants.size, height: Constants.size)
            VStack(alignment: .leading, spacing: 2) {
                Text("\(station.title)")
                Text("\(station.descr)")
            }
            Spacer()
            favoriteButton
        }
        .padding(5)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(3)
    }
    
    private var stationImage: some View {
        Group {
            if let image = service.image {
                Image(uiImage: image)
                    .resizable()
            } else {
                Image("music-note", bundle: Bundle(for: SailboatMedia.self))
                    .resizable()
            }
        }
    }
    
    let station: BrowseStationViewModel
    
    var body: some View {
        mainView
            .padding(.horizontal, 10)
    }
    
    init(station: BrowseStationViewModel) {
        self.station = station
        
        guard let imageUrl = station.imageUrl else { return }
        try? service.load(url: imageUrl)
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
