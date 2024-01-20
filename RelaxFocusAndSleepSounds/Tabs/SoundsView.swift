//
//  SoundsView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/14/24.
//

import SwiftUI

struct SoundsView: View {
    @State private var soundList = Category.getSoundList()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(soundList.indices, id: \.self) { categoryIndex in
                    let category = soundList[categoryIndex]
                    Section(header: Text(category.title)) {
                        ForEach(category.sounds.indices, id: \.self) { soundIndex in
                            let binding = $soundList[categoryIndex].sounds[soundIndex]
                            SoundCellView(sound: binding)
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
    SoundsView()
        .environmentObject(AudioManager())
}
