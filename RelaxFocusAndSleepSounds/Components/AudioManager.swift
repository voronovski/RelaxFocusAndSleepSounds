//
//  AudioManager.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/14/24.
//

import Foundation
import AVKit

final class AudioManager: ObservableObject {
    
    var player: AVAudioPlayer?
    
    func startPlayer(sound: String) {
        guard let url = Bundle.main.url(forResource: sound, withExtension: "m4a") else {
            print("Sound not found: \(sound)")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch {
            print("Fail to initialize player", error)
        }
        
    }
    
    func stop() {
        guard let player = player else { return }
        
        if player.isPlaying {
            player.stop()
        }
    }
}
