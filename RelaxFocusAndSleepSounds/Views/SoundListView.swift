//
//  SoundListView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/14/24.
//

import SwiftUI

struct SoundListView: View {

    @EnvironmentObject var sharedData: SharedData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Category.allCases) { category in
                    Section(header: Text(category.rawValue)) {
                        ForEach(sharedData.dataManager.sounds.enumerated().filter { $0.element.category == category }.map { $0.offset }, id: \.self) { index in
                            CellView(sound: sharedData.dataManager.sounds[index])
                        }
                    }
                    .headerProminence(.increased)
                }
            }
            .navigationTitle("Sounds")
            .toolbar {
                NavigationBarView()
            }
        }
    }
}

#Preview {
    SoundListView()
        .environmentObject(
            SharedData(
                audioManager: AudioManager(),
                dataManager: DataManager()
            )
        )
}
