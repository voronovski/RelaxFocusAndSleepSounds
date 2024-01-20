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
            SoundsView()
                .tabItem {
                    Image(systemName: "music.note.list")
                    Text("Sounds")
                }
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .accentColor(.red)
    }
}

#Preview {
    ContentView()
        .environmentObject(AudioManager())
}
