//
//  PlayButton.swift
//  SailboatMedia
//
//  Created by Dmitry Mazo on 1/3/21.
//

import SwiftUI

final class PlayButton: SailboatVisualComponent, ButtonDelegate {
    
    weak var player: RadioPlayer?
    
    var view: AnyView
    
    func tapped() {
        guard let player = self.player else { return }
        if player.isPlaying {
            player.pause()
        } else {
            player.play()
        }
    }
    
    init(view: AnyView) {
        self.view = view
    }
    
}
