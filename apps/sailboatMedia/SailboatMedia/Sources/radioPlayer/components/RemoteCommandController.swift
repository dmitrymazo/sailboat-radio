//
//  RemoteCommandController.swift
//  SailboatMedia
//
//  Created by Dmitry Mazo on 1/2/21.
//

import MediaPlayer
import Observable

final class RemoteCommandController: SailboatComponent {
    
    private let serialQueue = DispatchQueue(label: "Emitter-\(UUID().uuidString)")
    
    weak var player: RadioPlayer? {
        didSet {
            guard let player = player else { return }
            self.setup()
            
            player.currentRadioStationObserver.observe(serialQueue, { (station, _)  in
                guard let station = station else { return }
                DispatchQueue.main.async {
                    let nowPlayingInfoCenter = MPNowPlayingInfoCenter.default()
                    nowPlayingInfoCenter.nowPlayingInfo = Self.nowPlayingMetadata(title: station.name, imageData: nil)
                }
            }).add(to: &disposal)
        }
    }
    
    private var disposal = Disposal()
    
    private func setup() {
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
    
    private static func nowPlayingMetadata(title: String, imageData: Data?) -> [String: Any] {
        var nowPlayingInfo = [String: Any]()
        
        if let imageData = imageData
           , let image = UIImage(data: imageData) {
            let artwork = MPMediaItemArtwork(boundsSize: image.size) { _ in image }
            nowPlayingInfo[MPMediaItemPropertyArtwork] = artwork
        }
        
        nowPlayingInfo[MPNowPlayingInfoPropertyMediaType] = MPNowPlayingInfoMediaType.audio.rawValue
        nowPlayingInfo[MPMediaItemPropertyTitle] = title
        
        return nowPlayingInfo
    }
    
}
