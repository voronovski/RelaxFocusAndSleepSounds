//
//  SoundsView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/14/24.
//

import SwiftUI
import AVKit

struct SoundsView: View {
    @EnvironmentObject var audioManager: AudioManager

    var body: some View {
        NavigationView {
            List {
                ForEach(categories, id: \.title) { category in
                    Section(header: Text(category.title)) {
                        ForEach(category.sounds, id: \.id) { sound in
                            HStack {
                                Text(sound.name)
                                    .onTapGesture(count: 1) {
                                        audioManager.startPlayer(sound: sound.fileName)
                                    }
                                Spacer()
                                Button(action: {}) {
                                    Image(systemName: sound.isFavorite ? "heart.fill" : "heart")
                                }
                                .foregroundStyle(.red)
                            }
                        }
                    }
                    .headerProminence(.increased)
                }
            }
            .navigationTitle("Sounds")
            .toolbar {
                NavigationBarView(title: "Sounds")
            }
//            .navigationBarItems(leading: Text("Sounds").font(.title).fontWeight(.bold))
//            .toolbar {
//                ButtonView(icon: "timer", action: {})
//                ButtonView(icon: "stop.fill", action: {})
//            }
//            .navigationBarTitle("Sounds")
//            .navigationBarItems(trailing: 
//                Button(action: audioManager.stop, label: {
//                    Image(systemName: "stop.fill")
//                    .padding(EdgeInsets(top: 0,
//                                        leading: 0,
//                                        bottom: 0,
//                                        trailing: 10)
//                    )
//                })
//                .foregroundStyle(.red)
//            )
//            .navigationBarItems(trailing:
//                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                    Image(systemName: "timer")
//                })
//                .foregroundStyle(.red)
//            )
        }
    }
}

#Preview {
    SoundsView()
        .environmentObject(AudioManager())
}
