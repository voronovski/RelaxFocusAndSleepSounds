//
//  SoundListView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/14/24.
//

import SwiftUI

struct SoundListView: View {

    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Category.allCases) { category in
                    Section(header: Text(category.rawValue)) {
                        ForEach(dataManager.sounds.enumerated().filter { $0.element.category == category }.map { $0.offset }, id: \.self) { index in
                            CellView(sound: dataManager.sounds[index])
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
        .environmentObject(DataManager())
        .environmentObject(AudioManager())
}
