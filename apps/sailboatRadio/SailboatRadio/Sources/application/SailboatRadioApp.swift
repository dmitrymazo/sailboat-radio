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
    
    private var player = SailboatRadioPlayer(color: Color(UIColor(red: 0.8, green: 0, blue: 0, alpha: 1.0)))
    
    var body: some Scene {
        WindowGroup {
            TabContentView(player: player)
        }
    }
}
