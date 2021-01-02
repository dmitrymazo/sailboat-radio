//
//  RadioPlayer.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/2/21.
//

import Foundation

final class RadioPlayer {
    private(set) var view = RadioPlayerView()
}

protocol RadioPlayerViewDelegate: AnyObject { }

extension RadioPlayer: RadioPlayerViewDelegate {
    
}
