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
        "https://18193.live.streamtheworld.com/SAM03AAC226_SC",
        "https://19353.live.streamtheworld.com/977_HITS_SC",
        "https://18853.live.streamtheworld.com/977_SMOOJAZZ_SC",
        "https://streams.calmradio.com:4428/stream",
    ]
    
    @State
    private var currentUrlNo = 0
    
    var body: some View {
        VStack(spacing: 50) {
            Text("\(currentUrlNo)")
            VStack(spacing: 30) {
                Button("Load Previous") {
                    guard currentUrlNo > 0 else { return }
                    
                    let url = urls[currentUrlNo]
                    if currentUrlNo >= 0 {
                        currentUrlNo -= 1
                    }
                    try? player.load(url: url)
                    player.play()
                }.disabled(currentUrlNo == 0)
                
                Button("Load Next") {
                    guard currentUrlNo < urls.count else { return }
                    
                    let url = urls[currentUrlNo]
                    if currentUrlNo < urls.count - 1 {
                        currentUrlNo += 1
                    }
                    try? player.load(url: url)
                    player.play()
                }.disabled(currentUrlNo == urls.count - 1)
            }
            player.view
        }
    }
    
}
