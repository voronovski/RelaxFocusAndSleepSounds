//
//  SoundModel.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/14/24.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
    case electricShavers = "Electric shavers"
    case hairDryers = "Hair dryers"
    case vacuumCleaners = "Vacuum cleaners"
    
    var id: String { self.rawValue }
}

struct Sound: Identifiable {
    let id = UUID()
    let category: Category
    let name: String
    let fileName: String
    var isFavorite: Bool
    
    static func getInitialList() -> [Sound] {
        [
            Sound(category: .electricShavers, name: "Small old electric shaver", fileName: "es01", isFavorite: true),
            Sound(category: .hairDryers, name: "Standard hotel dryer", fileName: "hd01", isFavorite: true),
            Sound(category: .hairDryers, name: "Old fashion dryer", fileName: "hd02", isFavorite: true),
            Sound(category: .hairDryers, name: "Modern one", fileName: "hd03", isFavorite: false),
            Sound(category: .vacuumCleaners, name: "American vacuum cleaner", fileName: "vc01", isFavorite: true),
            Sound(category: .vacuumCleaners, name: "Style two standard cleaner", fileName: "vc02", isFavorite: false),
            Sound(category: .vacuumCleaners, name: "Ghosty vacuum", fileName: "vc03", isFavorite: false),
            Sound(category: .vacuumCleaners, name: "Next room vacuum", fileName: "vc04", isFavorite: false),
            Sound(category: .vacuumCleaners, name: "Modern vacuum cleaner", fileName: "vc05", isFavorite: true),
        ]
    }
}
