//
//  FavoritesListView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/29/24.
//

import SwiftUI

struct FavoritesListView: View {
    
    @EnvironmentObject var sharedData: SharedData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sharedData.dataManager.sounds.indices,
                        id: \.self
                ) { index in
                    if sharedData.dataManager.sounds[index].isFavorite {
                        CellView(sound: sharedData.dataManager.sounds[index])
                    }
                }
            }
            .navigationTitle("Favorites")
            .toolbar {
                NavigationBarView()
            }
        }
    }
}

#Preview {
    FavoritesListView()
        .environmentObject(
            SharedData(
                audioManager: AudioManager(),
                dataManager: DataManager()
            )
        )
}
