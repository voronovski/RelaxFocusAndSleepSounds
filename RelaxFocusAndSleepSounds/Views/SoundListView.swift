//
//  SoundListView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/14/24.
//

import SwiftUI

struct SoundListView: View {
    @Binding var soundList: [Category]
        
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

struct SoundListView_Previews: PreviewProvider {
    @State static var testSoundList =
    [Category(title: "Electric shavers", sounds: [
            Sound(name: "Small old electric shaver", fileName: "es01", isFavorite: true)])]

    static var previews: some View {
        SoundListView(soundList: $testSoundList)
            .environmentObject(AudioManager())
    }
}
