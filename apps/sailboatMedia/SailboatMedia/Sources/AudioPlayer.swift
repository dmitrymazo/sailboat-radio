//
//  AudioPlayer.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/2/21.
//

import AVFoundation

final class AudioPlayer {
    
    enum AudioPlayerError: Error {
        case invalidUrl
    }
    
    private var player: AVPlayer?
    
    // MARK: - Internal
    
    func load(url urlString: String) throws {
        guard let url = URL(string: urlString) else { throw AudioPlayerError.invalidUrl }
        
        let asset = AVURLAsset(url: url)
        let item = AVPlayerItem(asset: asset)
        self.player = AVPlayer(playerItem: item)
    }
    
    func play() {
        self.player?.play()
    }
    
    func pause() {
        self.player?.pause()
    }
    
    // MARK: - Init
    
    deinit {
        self.player?.replaceCurrentItem(with: nil)
    }
    
}
