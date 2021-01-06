//
//  FavoriteStationCell.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/3/21.
//  Copyright © 2021 SailboatDevelopment, Inc. All rights reserved.
//

import SwiftUI
import SailboatMedia

struct FavoriteStationCell: View {
    
    private struct Constants {
        static let size: CGFloat = 90
    }
    
    @ObservedObject
    private var service = ImageLoader()
    
    private var mainView: some View {
        VStack(spacing: 5) {
            stationImage
                .background(Color.red)
                .frame(width: Constants.size, height: Constants.size)
            Text("\(station.title)")
                .lineLimit(1)
            Text("\(service.isLoaded ? "loaded" : "no")")
        }
    }
    
    private var stationImage: some View {
        Group {
            if service.isLoaded {
                Image(uiImage: service.image!)
                    .resizable()
                    .cornerRadius(3)
            } else {
                Image("music-note", bundle: Bundle(for: SailboatMedia.self))
                    .resizable()
            }
        }
    }
    
    let station: FavoriteStationViewModel
    
    var body: some View {
        HStack(spacing: 10) {
            mainView
        }.padding(.bottom, 10)
        .padding(.horizontal, 6)
        .onAppear {
            guard let imageUrl = station.imageUrl else { return }
            try? service.load(url: imageUrl)
        }
    }
    
    init(station: FavoriteStationViewModel) {
        self.station = station
    }
    
}

struct FavoriteStationViewModel: Hashable {
    var id: String
    var title: String
    var descr: String
    var audioUrl: URL
    var imageUrl: URL?
}
