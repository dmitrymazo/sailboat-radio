//
//  RadioPlayer.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/2/21.
//

import Foundation

public final class SailboatRadioPlayer: RadioPlayer {
    
    public private(set) var view: SailboatRadioPlayerView
    
    private let player = AudioPlayer()
    
    private let components: [SailboatComponent]
    
    // MARK: - Private properties
    
    // MARK: - Public properties
    
    public private(set) var state = SailboatPlayerState.uninitialized
    
    public var isPlaying: Bool {
        return state == .playing
    }
    
    public private(set) var currentRadioStation: RadioStationItem?
    
    // MARK: - Private
    
    // MARK: - Public
    
    public func load(station: RadioStationItem) throws {
        try player.load(url: station.audioUrl)
        self.currentRadioStation = station
    }
    
    public func play() {
        player.play()
    }
    
    public func pause() {
        player.pause()
    }
    
    // MARK: - Init
    
    public init() {
        self.components = SailboatRadioComponents.getList()
        let visualComponents = components.compactMap { $0 as? SailboatVisualComponent }
        
        view = SailboatRadioPlayerView(components: visualComponents.map { $0.view })
        view.delegate = self
        player.delegate = self
        
        components.forEach { component in
            component.player = self
        }
    }
    
}

protocol RadioPlayer: AnyObject {
    var state: SailboatPlayerState { get }
    var currentRadioStation: RadioStationItem? { get }
    var isPlaying: Bool { get }
    func play()
    func pause()
}

protocol SailboatRadioPlayerViewDelegate: AnyObject {
    var state: SailboatPlayerState { get }
    var isPlaying: Bool { get }
    func play()
    func pause()
}

extension SailboatRadioPlayer: SailboatRadioPlayerViewDelegate { }

extension SailboatRadioPlayer: AudioPlayerDelegate {
    
    func update(state: AudioPlayerState) {
        switch state {
        case .uninitialized:
            self.state = .uninitialized
        case .loading:
            self.state = .loading
        case .readyToPlay:
            self.state = .readyToPlay
        case .playing:
            self.state = .playing
        case .paused:
            self.state = .paused
        case .error:
            self.state = .error
        }
    }
    
}

extension SailboatRadioPlayer: ObservableObject { }

public struct RadioStationItem {
    var title: String
    var audioUrl: URL
    
    public init(title: String,
                audioUrl: URL) {
        self.title = title
        self.audioUrl = audioUrl
    }
}
