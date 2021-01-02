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
            if let delegate = delegate {
                if delegate.state == .paused {
                    Button("Play") {
                        delegate.play()
                    }
                }
                if delegate.isPlaying {
                    Button("Pause") {
                        delegate.pause()
                    }
                }
            }
        }
    }
}
