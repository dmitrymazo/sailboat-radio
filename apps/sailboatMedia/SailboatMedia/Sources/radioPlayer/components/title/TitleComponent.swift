//
//  TitleComponent.swift
//  SailboatMedia
//
//  Created by Dmitry Mazo on 1/3/21.
//

import SwiftUI
import Observable

final class TitleComponent: SailboatVisualComponent {
    // move from here!!!!!
    let serialQueue = DispatchQueue(label: "Emitter-\(UUID().uuidString)")
    
    weak var player: RadioPlayer? {
        didSet {
            guard let player = self.player else { return }
            player.currentRadioStationObserver
                .observe(serialQueue) { [weak self] (station, _) in
                    DispatchQueue.main.async { [weak self] in
                        self?.title = station?.title ?? ""
                        self?.descr = station?.descr ?? ""
                    }
                }.add(to: &disposal)
        }
    }
    
    private(set) var title: String {
        didSet {
            self.titleView?.model.title = self.title
        }
    }
    
    private(set) var descr: String {
        didSet {
            self.titleView?.model.descr = self.descr
        }
    }
    
    private var disposal = Disposal()
    
    private var titleView: TitleView?
    
    var view: AnyView? {
        titleView != nil ? AnyView(titleView) : nil
    }
    
    init(view: TitleView?) {
        self.titleView = view
        title = ""
        descr = ""
    }
    
}
