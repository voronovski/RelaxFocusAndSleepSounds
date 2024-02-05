//
//  SharedData.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 2/1/24.
//

import Foundation

final class SharedData: ObservableObject {
    
    @Published var audioManager: AudioManager
    @Published var dataManager: DataManager
    
    init(audioManager: AudioManager, dataManager: DataManager) {
        self.audioManager = audioManager
        self.dataManager = dataManager
    }
}
