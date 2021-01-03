//
//  StationImageComponent.swift
//  SailboatMedia
//
//  Created by Dmitry Mazo on 1/3/21.
//

import SwiftUI

final class StationImageComponent: SailboatVisualComponent {
    
    weak var player: RadioPlayer?
    
    var view: AnyView
    
    init(view: AnyView) {
        self.view = view
    }
    
}
