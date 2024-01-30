//
//  SoundListView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/14/24.
//

import SwiftUI

struct SoundListView: View {
    @Binding var soundList: [Sound]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Category.allCases) { category in
                    Section(header: Text(category.rawValue)) {
                        ForEach(soundList.enumerated().filter { $0.element.category == category }.map { $0.offset }, id: \.self) { index in
                            SoundCellView(sound: $soundList[index])
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
    [Sound(category: .electricShavers, name: "Small old electric shaver", fileName: "es01", isFavorite: true),]
    
    static var previews: some View {
        SoundListView(soundList: $testSoundList)
            .environmentObject(AudioManager())
    }
}
