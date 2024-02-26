//
//  SoundModel.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/14/24.
//

import Foundation

enum Category: String, CaseIterable, Identifiable, Codable {
    case hairDryers = "Hair dryers"
    case vacuumCleaners = "Vacuum cleaners"
    case electricShavers = "Electric shavers"
    
    var id: String { self.rawValue }
}

// MARK: Immutable Struct

struct Sound: Identifiable, Codable {
    let id: UUID
    let category: Category
    let name: String
    let fileName: String
    let isFavorite: Bool
    
    init(id: UUID = UUID(), category: Category, name: String, fileName: String, isFavorite: Bool) {
        self.id = id
        self.category = category
        self.name = name
        self.fileName = fileName
        self.isFavorite = isFavorite
    }
    
    func toggleFavorite() -> Sound {
        return Sound(id: id, category: category, name: name, fileName: fileName, isFavorite: !isFavorite)
    }
}
