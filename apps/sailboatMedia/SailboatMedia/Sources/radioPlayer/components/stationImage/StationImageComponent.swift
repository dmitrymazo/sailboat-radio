//
//  StationImageComponent.swift
//  SailboatMedia
//
//  Created by Dmitry Mazo on 1/3/21.
//

import SwiftUI

final class StationImageComponent: SailboatVisualComponent {
    
    weak var player: RadioPlayer?
    
    private let imageView: StationImageView?
    
    var view: AnyView? {
        imageView != nil ? AnyView(imageView) : nil
    }
    
    init(view: StationImageView?) {
        self.imageView = view
    }
    
}
