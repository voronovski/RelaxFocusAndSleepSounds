//
//  DataManager.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 2/1/24.
//

import Foundation

final class DataManager: ObservableObject {
    
    @Published var sounds: [Sound] = [] {
        didSet {
            saveSounds()
        }
    }
    
    let soundsKey: String = "sounds_list"
    
    init() {
        getSounds()
    }
    
    func getSounds() {
        guard
            let data = UserDefaults.standard.data(forKey: soundsKey),
            let savedSounds = try? JSONDecoder().decode([Sound].self, from: data)
        else {
            let initialSounds = [
                Sound(category: .electricShavers, name: "Small old electric shaver", fileName: "es01", isFavorite: true),
                Sound(category: .hairDryers, name: "Standard hotel dryer", fileName: "hd01", isFavorite: true),
                Sound(category: .hairDryers, name: "Old fashion dryer", fileName: "hd02", isFavorite: false),
                Sound(category: .hairDryers, name: "Modern one", fileName: "hd03", isFavorite: false),
                Sound(category: .vacuumCleaners, name: "American vacuum cleaner", fileName: "vc01", isFavorite: true),
                Sound(category: .vacuumCleaners, name: "Portable car cleaner", fileName: "vc02", isFavorite: false),
                Sound(category: .vacuumCleaners, name: "Ghosty vacuum", fileName: "vc03", isFavorite: false),
                Sound(category: .vacuumCleaners, name: "Next room vacuum", fileName: "vc04", isFavorite: false),
                Sound(category: .vacuumCleaners, name: "Modern vacuum cleaner", fileName: "vc05", isFavorite: true),
            ]
            sounds.append(contentsOf: initialSounds)
            return
        }
        self.sounds = savedSounds
    }
    
    func toggleFavorite(sound: Sound) {
        if let index = sounds.firstIndex(where: { $0.id == sound.id }) {
            print("Значение isFavorite до: \(sounds[index].isFavorite)")
            sounds[index] = sound.toggleFavorite()
            print("Значение isFavorite после: \(sounds[index].isFavorite)")
        }
    }
    
    func saveSounds() {
        if let encodedData = try? JSONEncoder().encode(sounds) {
            UserDefaults.standard.set(encodedData, forKey: soundsKey)
        }
    }
}
