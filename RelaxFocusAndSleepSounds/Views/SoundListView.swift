//
//  SoundListView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/14/24.
//

import SwiftUI

struct SoundListView: View {
    @EnvironmentObject var dataManager: DataManager
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(Category.allCases, id: \.id) { category in
                    VStack(alignment: .leading) {
                        Text(category.rawValue)
                            .font(.headline)
                        
                        LazyVGrid(columns: columns) {
                            ForEach(dataManager.sounds.filter { $0.category == category }, id: \.id) { sound in
                                GridCellView(sound: sound)
                            }
                        }
                        .padding(.bottom)
                    }
                }
            }
            .padding()
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
