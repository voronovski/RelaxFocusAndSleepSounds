//
//  RelaxFocusAndSleepSoundsApp.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/8/24.
//

import SwiftUI

@main
struct RelaxFocusAndSleepSoundsApp: App {
    
    @StateObject var dataManager = DataManager()
    @StateObject var audioManager = AudioManager()
    
    @State private var isShowingSplash = true
    
    var body: some Scene {
        WindowGroup {
            if isShowingSplash {
                SplashScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            isShowingSplash = false
                        }
                    }
            } else {
                ContentView()
                    .environmentObject(dataManager)
                    .environmentObject(audioManager)
            }
        }
    }
}
