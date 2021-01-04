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
    
    private var buttonView: PlayButtonView?
    
    var view: AnyView? {
        buttonView != nil ? AnyView(buttonView) : nil
    }
    
    var isPlaying: Bool {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.buttonView?.imageName = self.isPlaying ? Constants.playButtonImageName : Constants.pauseButtonImageName
            }
        }
    }
    
    private func update(state: SailboatPlayerState) {
        isPlaying = (state == .playing)
    }
    
    init(view: PlayButtonView?) {
        self.buttonView = view
        isPlaying = false
        view?.imageName = Constants.pauseButtonImageName
    }
    
}
