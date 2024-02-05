//
//  RelaxFocusAndSleepSoundsApp.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/8/24.
//

import SwiftUI

@main
struct RelaxFocusAndSleepSoundsApp: App {
    
    @StateObject var sharedData = SharedData(
        audioManager: AudioManager(),
        dataManager: DataManager()
    )
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sharedData)
        }
    }
}
