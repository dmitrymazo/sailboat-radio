//
//  RadioPlayer.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/2/21.
//

import Foundation

public final class SailboatRadioPlayer {
    
    public private(set) var view = SailboatRadioPlayerView()
    
    private let player = AudioPlayer()
    
    // MARK: - Internal
    
    public func load(url: String) throws {
        try player.load(url: url)
    }
    
    public func play() {
        player.play()
    }
    
    public func pause() {
        player.pause()
    }
    
    // MARK: - Init
    
    public init() {
        view.delegate = self
    }
    
}

protocol SailboatRadioPlayerViewDelegate: AnyObject {
    func play()
    func pause()
}

extension SailboatRadioPlayer: SailboatRadioPlayerViewDelegate {
    
}