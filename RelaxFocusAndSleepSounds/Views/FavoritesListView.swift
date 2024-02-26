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
                if dataManager.sounds.filter({ $0.isFavorite }).isEmpty {
                    VStack {
                        Image(systemName: "heart.fill")
                            .font(.system(size: 100))
                            .foregroundColor(.gray)
                            .padding()
                        Text("Your Favorites list is empty now")
                    }
                } else {
                    List(dataManager.sounds.filter { $0.isFavorite }, id: \.id) { sound in
                        CellView(sound: sound)
                    }
                    .navigationTitle("Favorites")
                    .toolbar {
                        NavigationBarView()
                    }
                }
            } else {
                if dataManager.sounds.filter({ $0.isFavorite }).isEmpty {
                    VStack {
                        Image(systemName: "heart.text.square")
                            .font(.system(size: 100))
                            .foregroundStyle(.accent)
                            .padding()
                        VStack {
                            Text("Your Favorites is empty now.")
                                .font(.headline)
                            Text("Just click on the heart icon on the liked sound to add to your favorites.")
                                .font(.caption)
                        }
                        .frame(width: 250)
                        .multilineTextAlignment(.center)
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
}

#Preview {
    FavoritesListView()
        .environmentObject(DataManager())
        .environmentObject(AudioManager())
}
