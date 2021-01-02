//
//  RadioPlayerView.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/2/21.
//

import SwiftUI

public struct SailboatRadioPlayerView: View {
    weak var delegate: SailboatRadioPlayerViewDelegate?
    
    public var body: some View {
        VStack(spacing: 50) {
            Button("Play") {
                delegate?.play()
            }
            Button("Pause") {
                delegate?.pause()
            }
        }
    }
}
