//
//  SailboatRadioComponents.swift
//  SailboatMedia
//
//  Created by Dmitry Mazo on 1/3/21.
//

import SwiftUI

struct SailboatRadioComponents {
    
    static func getList() -> [SailboatComponent] {
        let playButton = PlayButton()
        let playButtonView = PlayButtonView(model: PlayButtonModel(), presenter: playButton)
        playButton.buttonView = playButtonView
        
        let titleView = TitleView(model: TitleModel())
        let titleComponent = TitleComponent(view: titleView)
        
        return [
            RemoteCommandController(),
            StationImageComponent(view: StationImageView(model: StationImageModel(imageName: "music-note"))),
            titleComponent,
            playButton
        ]
    }
    
}
