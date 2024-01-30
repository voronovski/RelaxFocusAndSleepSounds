//
//  ContentView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/8/24.
//

import SwiftUI

struct ContentView: View {
    @State private var soundList = Sound.getInitialList()
    
    var body: some View {
        TabView {
            SoundListView(soundList: $soundList)
                .tabItem {
                    Label("Sounds", systemImage: "music.note.list")
                }
            FavoritesListView(soundList: $soundList)
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
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
        .environmentObject(AudioManager())
}
