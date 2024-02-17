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
                // Итерация по всем категориям
                ForEach(Category.allCases, id: \.id) { category in
                    // Секция для каждой категории
                    VStack(alignment: .leading) {
                        Text(category.rawValue)
                            .font(.headline)

                        LazyVGrid(columns: columns) {
                            // Фильтрация звуков по текущей категории и их отображение
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
