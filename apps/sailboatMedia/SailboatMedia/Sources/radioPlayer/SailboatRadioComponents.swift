//
//  SailboatRadioComponents.swift
//  SailboatMedia
//
//  Created by Dmitry Mazo on 1/3/21.
//

import SwiftUI

struct SailboatRadioComponents {
    static func getList() -> [SailboatComponent] {
        var playButtonView = PlayButtonView(imageName: "play-icon")
        let playButton = PlayButton(view: AnyView(playButtonView))
        playButtonView.delegate = playButton
        
//        let titleView = TitleView()
//        let titleComponent = TitleComponent(view: titleView)
        
        return [
            RemoteCommandController(),
//            titleComponent,
            playButton
        ]
    }
}
