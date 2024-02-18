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
            List(Category.allCases, id: \.id) { category in
                Section(header: Text(category.rawValue)) {
                    ForEach(dataManager.sounds.filter { $0.category == category }, id: \.id) { sound in
                        CellView(sound: sound)
                    }
                }
                .headerProminence(.increased)
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
