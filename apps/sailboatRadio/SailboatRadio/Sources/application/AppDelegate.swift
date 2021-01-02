//
//  AppDelegate.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/2/21.
//

import UIKit
import AVFoundation

final class AppDelegate: NSObject, UIApplicationDelegate {
    
    private func setupAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .default, policy: .longFormAudio)
        }
        catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        self.setupAudioSession()
        
        return true
    }
}
