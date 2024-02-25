//
//  DataManager.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 2/1/24.
//

import Foundation

final class DataManager: ObservableObject {
    
    enum DisplayType: String, CaseIterable, Identifiable {
        case grid = "Grid"
        case list = "List"
        
        var id: String { self.rawValue }
    }
    
    enum Theme: String, CaseIterable, Identifiable {
        case system = "System"
        case light = "Light"
        case dark = "Dark"
        
        var id: String { self.rawValue }
    }
    
    @Published var currentTheme: Theme = .system
    
    @Published var displayType: DisplayType = .grid {
        didSet {
            saveDisplayType()
        }
    }
    
    @Published var sounds: [Sound] = [] {
        didSet {
            saveSounds()
        }
    }
    
    let displayTypeKey: String = "display_type"
    let soundsKey: String = "sounds_list"
    
    init() {
        getDisplayType()
        getSounds()
    }
    
    func getSounds() {
        guard
            let data = UserDefaults.standard.data(forKey: soundsKey),
            let savedSounds = try? JSONDecoder().decode([Sound].self, from: data)
        else {
            let initialSounds = [
                Sound(category: .electricShavers, name: "Small old electric shaver", fileName: "es01", isFavorite: true),
                Sound(category: .electricShavers, name: "Electric razor", fileName: "es02", isFavorite: false),
                Sound(category: .electricShavers, name: "ASMR Barbershop", fileName: "es03", isFavorite: false),
                Sound(category: .hairDryers, name: "Standard hotel dryer", fileName: "hd01", isFavorite: false),
                Sound(category: .hairDryers, name: "Old fashion dryer", fileName: "hd02", isFavorite: false),
                Sound(category: .hairDryers, name: "Modern one", fileName: "hd03", isFavorite: false),
                Sound(category: .vacuumCleaners, name: "American vacuum cleaner", fileName: "vc01", isFavorite: false),
                Sound(category: .vacuumCleaners, name: "Portable car cleaner", fileName: "vc02", isFavorite: false),
                Sound(category: .vacuumCleaners, name: "Ghosty vacuum", fileName: "vc03", isFavorite: false),
                Sound(category: .vacuumCleaners, name: "Next room vacuum", fileName: "vc04", isFavorite: false),
                Sound(category: .vacuumCleaners, name: "Modern vacuum cleaner", fileName: "vc05", isFavorite: false),
                Sound(category: .vacuumCleaners, name: "Robot vacuum cleaner", fileName: "vc06", isFavorite: false),
            ]
            sounds = initialSounds
            return
        }
        sounds = savedSounds
    }
    
    func toggleFavorite(sound: Sound) {
        if let index = sounds.firstIndex(where: { $0.id == sound.id }) {
            sounds[index] = sound.toggleFavorite()
        }
    }
    
    func saveSounds() {
        if let encodedData = try? JSONEncoder().encode(sounds) {
            UserDefaults.standard.set(encodedData, forKey: soundsKey)
        }
    }
    
    func getDisplayType() {
        if let savedValue = UserDefaults.standard.string(forKey: "displayType"),
               let savedDisplayType = DisplayType(rawValue: savedValue) {
                displayType = savedDisplayType
            } else {
                displayType = .grid
            }
    }
    
    func saveDisplayType() {
        UserDefaults.standard.set(displayType.rawValue, forKey: displayTypeKey)
    }
}
