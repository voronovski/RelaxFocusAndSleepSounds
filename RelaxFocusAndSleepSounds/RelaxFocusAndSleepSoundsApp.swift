//
//  RelaxFocusAndSleepSoundsApp.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/8/24.
//

import SwiftUI

@main
struct RelaxFocusAndSleepSoundsApp: App {
    @StateObject var audioManager = AudioManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioManager)
        }
    }
}
