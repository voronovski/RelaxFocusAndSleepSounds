//
//  FavoritesListView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/29/24.
//

import SwiftUI

struct FavoritesListView: View {
    @Binding var soundList: [Category]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FavoritesListView_Previews: PreviewProvider {
    @State static var testSoundList =
    [Category(title: "Electric shavers", sounds: [
            Sound(name: "Small old electric shaver", fileName: "es01", isFavorite: true)])]

    static var previews: some View {
        FavoritesListView(soundList: $testSoundList)
            .environmentObject(AudioManager())
    }
}
