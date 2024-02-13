//
//  FavoritesListView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/29/24.
//

import SwiftUI

struct FavoritesListView: View {
    
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dataManager.sounds.indices,
                        id: \.self
                ) { index in
                    if dataManager.sounds[index].isFavorite {
                        CellView(sound: dataManager.sounds[index])
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
        .environmentObject(DataManager())
        .environmentObject(AudioManager())
}
