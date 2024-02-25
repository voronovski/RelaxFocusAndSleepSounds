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
            if dataManager.displayType == .list {
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
            } else {
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
}


#Preview {
    SoundListView()
        .environmentObject(DataManager())
        .environmentObject(AudioManager())
}
