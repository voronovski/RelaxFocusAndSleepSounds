//
//  SoundCellView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/16/24.
//

import SwiftUI
import AVKit

struct SoundCellView: View {
    @EnvironmentObject var audioManager: AudioManager
    
    @Binding var sound: Sound
    
    var body: some View {
        HStack {
            Text(sound.name)
                .onTapGesture(count: 1) {
                    audioManager.startPlayer(sound: sound.fileName)
                }
            Spacer()
            ButtonView(
                icon: sound.isFavorite ? "star.fill" : "star",
                action: toggleFavorite
            )
        }
    }
    
    private func toggleFavorite() {
        sound.isFavorite.toggle()
    }
}

struct SoundCellView_Previews: PreviewProvider {
    @State static var testSound = Sound(category: .electricShavers, name: "Small old electric shaver", fileName: "es01", isFavorite: true)

    static var previews: some View {
        SoundCellView(sound: $testSound)
            .environmentObject(AudioManager())
    }
}
