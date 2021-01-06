//
//  StationImageComponent.swift
//  SailboatMedia
//
//  Created by Dmitry Mazo on 1/3/21.
//

import SwiftUI
import Observable

final class StationImageComponent: SailboatVisualComponent {
    let serialQueue = DispatchQueue(label: "Emitter-\(UUID().uuidString)")
    
    weak var player: RadioPlayer?
    
    private var disposal = Disposal()
    
    private let imageView: StationImageView?
    
    var view: AnyView? {
        imageView != nil ? AnyView(imageView) : nil
    }
    
    init(view: StationImageView?) {
        self.imageView = view
    }
    
}
