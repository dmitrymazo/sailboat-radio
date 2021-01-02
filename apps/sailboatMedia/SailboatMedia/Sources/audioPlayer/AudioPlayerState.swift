//
//  AudioPlayerState.swift
//  SailboatMedia
//
//  Created by Dmitry Mazo on 1/2/21.
//

import Foundation

enum AudioPlayerState {
    case uninitialized
    case loading
    case readyToPlay
    case playing
    case paused
    case error
}
