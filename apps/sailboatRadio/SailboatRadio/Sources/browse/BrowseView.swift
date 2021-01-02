//
//  BrowseView.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/2/21.
//

import SwiftUI
import SailboatMedia

struct BrowseView: View {
    
    private let player = SailboatRadioPlayer()
    
    private let urls = [
        "https://masima.rastream.com/masima-pramborsjakarta?awparams=stationid:masima-pramborsjakarta",
        "https://0n-country.radionetz.de/0n-country.aac",
        "https://streams.calmradio.com:4428/stream",
        "https://18193.live.streamtheworld.com/SAM03AAC226_SC"
    ]
    
    @State
    private var currentUrlNo = 0
    
    var body: some View {
        VStack(spacing: 50) {
            HStack(spacing: 30) {
                if currentUrlNo > 0 {
                    Button("Load Previous") {
                        guard currentUrlNo > 0 else { return }
                        
                        let url = urls[currentUrlNo]
                        try? player.load(url: url)
                        currentUrlNo -= 1
                        player.play()
                    }
                }
                if currentUrlNo < urls.count {
                    Button("Load Next") {
                        guard currentUrlNo < urls.count else { return }
                        
                        let url = urls[currentUrlNo]
                        try? player.load(url: url)
                        currentUrlNo += 1
                        player.play()
                    }
                }
            }
            player.view
        }
    }
    
}
