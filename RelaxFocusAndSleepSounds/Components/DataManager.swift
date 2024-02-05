//
//  DataManager.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 2/1/24.
//

import Foundation

final class DataManager: ObservableObject {
    
    @Published var sounds: [Sound] = []
    
    init() {
        getSounds()
    }
    
    func getSounds() {
        let initialSounds = [
            Sound(category: .electricShavers, name: "Small old electric shaver", fileName: "es01", isFavorite: true),
            Sound(category: .hairDryers, name: "Standard hotel dryer", fileName: "hd01", isFavorite: true),
            Sound(category: .hairDryers, name: "Old fashion dryer", fileName: "hd02", isFavorite: false),
            Sound(category: .hairDryers, name: "Modern one", fileName: "hd03", isFavorite: false),
            Sound(category: .vacuumCleaners, name: "American vacuum cleaner", fileName: "vc01", isFavorite: true),
            Sound(category: .vacuumCleaners, name: "Style two standard cleaner", fileName: "vc02", isFavorite: false),
            Sound(category: .vacuumCleaners, name: "Ghosty vacuum", fileName: "vc03", isFavorite: false),
            Sound(category: .vacuumCleaners, name: "Next room vacuum", fileName: "vc04", isFavorite: false),
        ]
        sounds.append(contentsOf: initialSounds)
    }
    
    func toggleFavorite(sound: Sound) {
//        if let index = sounds.firstIndex(where: { $0.id == sound.id }) {
//            sounds[index] = sound.toggleFavorite()
//        }
        if let index = sounds.firstIndex(where: { $0.id == sound.id }) {
                print("Значение isFavorite до: \(sounds[index].isFavorite)")
                sounds[index] = sound.toggleFavorite()
                print("Значение isFavorite после: \(sounds[index].isFavorite)")
            }
    }
}
