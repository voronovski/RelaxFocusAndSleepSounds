//
//  SoundCellView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/16/24.
//

import SwiftUI
import AVKit

struct CellView: View {
    
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var dataManager: DataManager
    
    var sound: Sound
    
    var body: some View {
        HStack {
            Text(sound.name)
                .onTapGesture(count: 1) {
                    audioManager.startPlayer(sound: sound.fileName)
                }
            Spacer()
            Image(systemName: sound.isFavorite ? "heart.fill" : "heart")
                .onTapGesture {
                    withAnimation {
                        dataManager.toggleFavorite(sound: sound)
                    }
                }
                .foregroundStyle(.accent)
        }
    }
}

#Preview {
    CellView(sound: Sound(category: .electricShavers, name: "Small old electric shaver", fileName: "es01", isFavorite: true))
        .environmentObject(AudioManager())
}
