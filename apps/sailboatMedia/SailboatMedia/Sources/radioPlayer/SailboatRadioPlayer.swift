//
//  RadioPlayer.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/2/21.
//

import Foundation
import Observable
import struct SwiftUI.Color

public final class SailboatRadioPlayer: RadioPlayer {
    
    public private(set) var view: SailboatRadioPlayerView
    
    private let player = AudioPlayer()
    
    private let components: [SailboatComponent]
    
    // MARK: - Observers
    
    public var stateObserver: Observable<SailboatPlayerState> {
        return _state
    }
    
    public var currentRadioStationObserver: Observable<RadioStationItem?> {
        return _currentRadioStation
    }
    
    private var disposal = Disposal()
    
    // MARK: - Private properties
    
    // MARK: - Public properties
    
    @MutableObservable
    public private(set) var state = SailboatPlayerState.uninitialized
    
    public var isPlaying: Bool {
        return state == .playing
    }
    
    @MutableObservable
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
    
    public init(color: Color) {
        self.components = SailboatRadioComponents.getList()
        let visualComponents = components.compactMap { $0 as? SailboatVisualComponent }
        
        view = SailboatRadioPlayerView(color: color, components: visualComponents.compactMap { $0.view })
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
    var stateObserver: Observable<SailboatPlayerState> { get }
    var currentRadioStationObserver: Observable<RadioStationItem?> { get }
}

protocol SailboatRadioPlayerViewDelegate: AnyObject {
    var state: SailboatPlayerState { get }
    var currentRadioStation: RadioStationItem? { get }
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
    var descr: String?
    var audioUrl: URL
    var imageUrl: URL?
    
    public init(title: String,
                descr: String,
                audioUrl: URL,
                imageUrl: URL?) {
        self.title = title
        self.descr = descr
        self.audioUrl = audioUrl
        self.imageUrl = imageUrl
    }
}
