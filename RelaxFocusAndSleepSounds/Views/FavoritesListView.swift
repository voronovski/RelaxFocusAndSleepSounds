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
            List(dataManager.sounds.filter { $0.isFavorite }, id: \.id) { sound in
                CellView(sound: sound)
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
