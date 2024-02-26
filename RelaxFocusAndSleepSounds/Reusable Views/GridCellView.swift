//
//  GridCellView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 2/24/24.
//

import SwiftUI

struct GridCellView: View {
    
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var dataManager: DataManager
    
    var sound: Sound
    
    var body: some View {
        VStack {
            ZStack {
                Image(sound.fileName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                    .shadow(radius: 10)
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
            Text(sound.name)
                .font(.caption)
                .frame(width: 100)
                .lineLimit(1)
        }
    }
}

#Preview {
    GridCellView(sound: Sound(category: .electricShavers, name: "Small old electric shaver", fileName: "es01", isFavorite: true))
        .environmentObject(AudioManager())
}
