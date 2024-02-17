//
//  GridCellView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 2/16/24.
//

import SwiftUI

struct GridCellView: View {
    
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var dataManager: DataManager
    
    var sound: Sound
    
    var body: some View {
        ZStack {
            ZStack {
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.gray)
                    .opacity(0.4)
                    .cornerRadius(20)
                Text(sound.fileName)
            }
            .onTapGesture(count: 1) {
                audioManager.startPlayer(sound: sound.fileName)
            }

            Image(systemName: sound.isFavorite ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 22, height: 22)
                .offset(x: 28, y: -28)
                .foregroundStyle(.accent)
                .onTapGesture {
                    withAnimation {
                        dataManager.toggleFavorite(sound: sound)
                    }
                }
        }
    }
}

#Preview {
    GridCellView(sound: Sound(category: .electricShavers, name: "Small old electric shaver", fileName: "es01", isFavorite: true))
        .environmentObject(AudioManager())
}
