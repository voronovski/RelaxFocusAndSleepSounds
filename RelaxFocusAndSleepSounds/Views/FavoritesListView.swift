//
//  FavoritesListView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/29/24.
//

import SwiftUI

struct FavoritesListView: View {
    
    @EnvironmentObject var dataManager: DataManager
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView {
            if dataManager.displayType == .list {
                List(dataManager.sounds.filter { $0.isFavorite }, id: \.id) { sound in
                    CellView(sound: sound)
                }
                .navigationTitle("Favorites")
                .toolbar {
                    NavigationBarView()
                }
            } else {
                VStack {
                    LazyVGrid(columns: columns, alignment: .leading) {
                        ForEach(dataManager.sounds.filter { $0.isFavorite }, id: \.id) { sound in
                            GridCellView(sound: sound)
                        }
                    }
                    Spacer()
                }
                .padding()
                .navigationTitle("Favorites")
                .toolbar {
                    NavigationBarView()
                }
            }
        }
    }
}


#Preview {
    FavoritesListView()
        .environmentObject(DataManager())
        .environmentObject(AudioManager())
}
