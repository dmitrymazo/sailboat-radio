//
//  BrowseStationCell.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/3/21.
//  Copyright © 2021 SailboatDevelopment, Inc. All rights reserved.
//

import SwiftUI

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
                .background(Color.red)
                .frame(width: Constants.size, height: Constants.size)
            VStack(spacing: 2) {
                Text("\(station.title)")
                Text("\(station.descr)")
            }
            Spacer()
            favoriteButton
        }
    }
    
    private var stationImage: some View {
        Group {
            if let image = service.image {
                Image(uiImage: image)
                    .resizable()
            } else {
                Image("musicNote")
                    .resizable()
            }
        }
    }
    
    let station: BrowseStationViewModel
    
    var body: some View {
        mainView
            .padding(.bottom, 6)
            .padding(.horizontal, 10)
            .onAppear {
                guard let imageUrl = station.imageUrl else { return }
                try? service.load(url: imageUrl)
            }
    }
    
    init(station: BrowseStationViewModel) {
        self.station = station
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
