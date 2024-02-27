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
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            isShowingSplash = false
                        }
                    }
            } else {
                ContentView()
                    .environmentObject(dataManager)
                    .environmentObject(audioManager)
                    .onAppear {
                        dataManager.applyTheme(dataManager.currentTheme)
                    }
                    .onChange(of: dataManager.currentTheme) { newTheme in
                        dataManager.applyTheme(newTheme)
                    }
            }
        }
    }
}
