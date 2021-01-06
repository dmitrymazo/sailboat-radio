//
//  PlayButton.swift
//  SailboatMedia
//
//  Created by Dmitry Mazo on 1/3/21.
//

import SwiftUI
import Observable

final class PlayButton: SailboatVisualComponent, ButtonDelegate {
    
    private struct Constants {
        static let playButtonImageName = "play-icon"
        static let pauseButtonImageName = "pause-icon"
    }
    // move from here!!!!!
    let serialQueue = DispatchQueue(label: "Emitter-\(UUID().uuidString)")
    
    weak var player: RadioPlayer? {
        didSet {
            guard let player = self.player else { return }
            player.stateObserver
                .observe(serialQueue) { [weak self] (state, _) in                    
                    self?.update(state: state)
                }.add(to: &disposal)
        }
    }
    
    func tapped() {
        guard let player = self.player else { return }
        if player.isPlaying {
            player.pause()
        } else {
            player.play()
        }
    }
    
    private var disposal = Disposal()
    
    var buttonView: PlayButtonView?
    
    var view: AnyView? {
        buttonView != nil ? AnyView(buttonView) : nil
    }
    
    var isPlayButton: Bool? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                switch self.isPlayButton {
                case true:
                    self.buttonView?.model.imageName = Constants.playButtonImageName
                case false:
                    self.buttonView?.model.imageName = Constants.pauseButtonImageName
                default:
                    self.buttonView?.model.imageName = nil
                }
            }
        }
    }
    
    private func update(state: SailboatPlayerState) {
        switch state {
        case .playing:
            isPlayButton = false
        case .paused:
            isPlayButton = true
        default:
            isPlayButton = nil
        }
    }
    
    init() {
        isPlayButton = true
    }
    
}
