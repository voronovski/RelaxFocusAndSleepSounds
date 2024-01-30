//
//  FavoritesListView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/29/24.
//

import SwiftUI

struct FavoritesListView: View {
    @Binding var soundList: [Sound]

        var body: some View {
            NavigationView {
                List {
                    ForEach(soundList.indices, id: \.self) { index in
                        if soundList[index].isFavorite {
                            SoundCellView(sound: $soundList[index])
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

struct FavoritesListView_Previews: PreviewProvider {
    @State static var testSoundList =
    [Sound(category: .electricShavers, name: "Small old electric shaver", fileName: "es01", isFavorite: true),]
    
    static var previews: some View {
        FavoritesListView(soundList: $testSoundList)
            .environmentObject(AudioManager())
    }
}
