//
//  DataManager.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 2/1/24.
//

import Foundation
import SwiftUI

final class DataManager: ObservableObject {
    
    enum DisplayType: String, CaseIterable, Identifiable {
        case grid = "Grid"
        case list = "List"
        
        var id: String { self.rawValue }
        
        var title: LocalizedStringResource {
            switch self {
                case .grid: "Grid"
                case .list: "List"
            }
        }
    }
    
    enum Theme: String, CaseIterable, Identifiable {
        case system = "System"
        case light = "Light"
        case dark = "Dark"
        
        var id: String { self.rawValue }
        
        var title: LocalizedStringResource {
            switch self {
                case .system: "System"
                case .light: "Light"
                case .dark: "Dark"
            }
        }
    }
    
    @Published var currentTheme: Theme = .system {
        didSet {
            saveTheme()
        }
    }
    
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
    
    let themeKey: String = "theme_key"
    let displayTypeKey: String = "display_type"
    let soundsKey: String = "sounds_list"
    
    init() {
        getTheme()
        getDisplayType()
        getSounds()
    }
    
    func getSounds() {
        guard
            let data = UserDefaults.standard.data(forKey: soundsKey),
            let savedSounds = try? JSONDecoder().decode([Sound].self, from: data)
        else {
            let initialSounds = [
                Sound(category: .hairDryers, name: "Hotel", fileName: "hd01", isFavorite: false),
                Sound(category: .hairDryers, name: "Old fashion", fileName: "hd02", isFavorite: false),
                Sound(category: .hairDryers, name: "Modern", fileName: "hd03", isFavorite: false),
                Sound(category: .vacuumCleaners, name: "American", fileName: "vc01", isFavorite: false),
                Sound(category: .vacuumCleaners, name: "Portable", fileName: "vc02", isFavorite: false),
                Sound(category: .vacuumCleaners, name: "Ghosty", fileName: "vc03", isFavorite: false),
                Sound(category: .vacuumCleaners, name: "Next room", fileName: "vc04", isFavorite: false),
                Sound(category: .vacuumCleaners, name: "Modern", fileName: "vc05", isFavorite: false),
                Sound(category: .vacuumCleaners, name: "Robot", fileName: "vc06", isFavorite: false),
                Sound(category: .electricShavers, name: "Old electric shaver", fileName: "es01", isFavorite: false),
                Sound(category: .electricShavers, name: "Electric razor", fileName: "es02", isFavorite: false),
                Sound(category: .electricShavers, name: "ASMR Barbershop", fileName: "es03", isFavorite: false),
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
        if let savedValue = UserDefaults.standard.string(forKey: displayTypeKey),
           let savedDisplayType = DisplayType(rawValue: savedValue) {
            displayType = savedDisplayType
        } else {
            displayType = .grid
        }
    }
    
    func saveDisplayType() {
        UserDefaults.standard.set(displayType.rawValue, forKey: displayTypeKey)
    }
    
    func getTheme() {
        if let savedValue = UserDefaults.standard.string(forKey: themeKey),
           let savedTheme = Theme(rawValue: savedValue) {
            currentTheme = savedTheme
        } else {
            currentTheme = .system
        }
    }
    
    func saveTheme() {
        UserDefaults.standard.set(currentTheme.rawValue, forKey: themeKey)
    }
    
    func applyTheme(_ theme: Theme) {
        DispatchQueue.main.async {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            windowScene.windows.forEach { window in
                switch theme {
                case .system:
                    window.overrideUserInterfaceStyle = .unspecified
                case .light:
                    window.overrideUserInterfaceStyle = .light
                case .dark:
                    window.overrideUserInterfaceStyle = .dark
                }
            }
        }
    }
}
