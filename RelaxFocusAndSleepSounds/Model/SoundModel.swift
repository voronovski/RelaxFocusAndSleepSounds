//
//  SoundModel.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/14/24.
//

import Foundation

struct Sound: Identifiable {
    let id = UUID()
    let name: String
    let fileName: String
    var isFavorite: Bool
}

struct Category: Identifiable {
    let id = UUID()
    let title: String
    var sounds: [Sound]
    
    static func getSoundList() -> [Category] {
        [Category(title: "Electric shavers", sounds: [
            Sound(name: "Small old electric shaver", fileName: "es01", isFavorite: true),
        ]),
        Category(title: "Hair dryers", sounds: [
            Sound(name: "Standard hotel dryer", fileName: "hd01", isFavorite: true),
            Sound(name: "Old fashion dryer", fileName: "hd02", isFavorite: false),
            Sound(name: "Modern one", fileName: "hd03", isFavorite: false),
        ]),
        Category(title: "Vacuum cleaners", sounds: [
            Sound(name: "American vacuum cleaner", fileName: "vc01", isFavorite: true),
            Sound(name: "Style two standard cleaner", fileName: "vc02", isFavorite: false),
            Sound(name: "Ghosty vacuum", fileName: "vc03", isFavorite: false),
            Sound(name: "Next room vacuum", fileName: "vc04", isFavorite: false),
        ]),
        ]
    }
}
