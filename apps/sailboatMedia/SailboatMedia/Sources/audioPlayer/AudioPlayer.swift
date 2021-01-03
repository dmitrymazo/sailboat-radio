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
    
    // MARK: - Internal properties
    
    weak var delegate: AudioPlayerDelegate?
    
    private(set) var state = AudioPlayerState.uninitialized {
        didSet {
            guard state != oldValue else { return }
            delegate?.update(state: state)
        }
    }
    
    // MARK: - Internal
    
    func load(url: URL) throws {
        state = .loading
        let asset = AVURLAsset(url: url)
        let item = AVPlayerItem(asset: asset)
        self.player = AVPlayer(playerItem: item)
    }
    
    func play() {
        state = .playing
        self.player?.play()
    }
    
    func pause() {
        state = .paused
        self.player?.pause()
    }
    
    // MARK: - Init
    
    deinit {
        self.player?.replaceCurrentItem(with: nil)
    }
    
}

protocol AudioPlayerDelegate: AnyObject {
    func update(state: AudioPlayerState)
}
