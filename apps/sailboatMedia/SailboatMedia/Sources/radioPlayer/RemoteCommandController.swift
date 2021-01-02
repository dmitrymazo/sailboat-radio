//
//  RemoteCommandController.swift
//  SailboatMedia
//
//  Created by Dmitry Mazo on 1/2/21.
//

import MediaPlayer

final class RemoteCommandController {
    
    weak var player: RadioPlayer?
    
    func setup() {
        let commandCenter = MPRemoteCommandCenter.shared()

        commandCenter.playCommand.addTarget { [unowned self] event in
            guard let player = self.player else { return .commandFailed }
            if !player.isPlaying {
                player.play()
                return .success
            }
            return .commandFailed
        }

        commandCenter.pauseCommand.addTarget { [unowned self] event in
            guard let player = self.player else { return .commandFailed }
            if player.isPlaying {
                player.pause()
                return .success
            }
            return .commandFailed
        }
    }
    
}
