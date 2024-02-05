//
//  ContentView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/8/24.
//

import SwiftUI

struct ContentView: View {
        
     var body: some View {
        TabView {
            SoundListView()
                .tabItem {
                    Label("Sounds", systemImage: "music.note.list")
                }
            FavoritesListView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
        .accentColor(.red)
    }
}

#Preview {
    ContentView()
        .environmentObject(
            SharedData(
                audioManager: AudioManager(),
                dataManager: DataManager()
            )
        )
}
