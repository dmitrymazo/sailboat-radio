//
//  BrowseView.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/2/21.
//

import Foundation
import SwiftUI
import SailboatMedia

struct BrowseView: View {
    
    private let player = SailboatRadioPlayer()
    
    private let urls = [
        "https://masima.rastream.com/masima-pramborsjakarta?awparams=stationid:masima-pramborsjakarta",
        "https://0n-country.radionetz.de/0n-country.aac"
    ]
    
    @State
    private var currentUrlNo = 0
    
    var body: some View {
        VStack(spacing: 50) {
            Button("Load Next") {
                let url = urls[currentUrlNo]
                try? player.load(url: url)
                currentUrlNo += 1
                player.play()
            }
            player.view
        }
    }
    
}
