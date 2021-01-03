//
//  RadioPlayerView.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/2/21.
//

import SwiftUI

public struct SailboatRadioPlayerView: View {
    
    private struct Constants {
        static let width: CGFloat = 90
        static let opacity = 0.7
    }
    var color: Color = .blue
    
    weak var delegate: SailboatRadioPlayerViewDelegate?
    
    public var body: some View {
        
        HStack(spacing: 30) {
            if let delegate = delegate {
//                if delegate.state == .paused {
                    Button("Play") {
                        delegate.play()
                    }
//                }
//                if delegate.isPlaying {
                    Button("Pause") {
                        delegate.pause()
                    }
//                }
            }
        }.frame(maxWidth: .infinity, maxHeight: Constants.width)
        .background(color.opacity(Constants.opacity))
    }
}
