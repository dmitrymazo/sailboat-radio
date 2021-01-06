//
//  SailboatRadioApp.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/2/21.
//

import SwiftUI
import SailboatMedia

@main
struct SailboatRadioApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    private var player = SailboatRadioPlayer(color: Color(UIColor.brown))
    
    var body: some Scene {
        WindowGroup {
            TabContentView(player: player)
        }
    }
}
