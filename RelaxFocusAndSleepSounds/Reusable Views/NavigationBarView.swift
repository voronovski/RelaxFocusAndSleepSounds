//
//  NavigationBarView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/16/24.
//

import SwiftUI

struct NavigationBarView: View {
    
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var dataManager: DataManager
    
    @State private var showingTimerList = false
    
    var body: some View {
        HStack {
            Image(dataManager.isListView ? "square.grid.3x3.fill" : "checklist.unchecked")
                .onTapGesture {
                    withAnimation {
                        dataManager.isListView.toggle()
                    }
                }
                .foregroundStyle(.accent)
            ButtonView(icon: dataManager.isListView ? "square.grid.3x3.fill" : "checklist.unchecked", action: {
                dataManager.isListView.toggle()
            })
            ButtonView(icon: "timer", action: {
                showingTimerList.toggle()
            })
            ButtonView(icon: "stop.fill", action: audioManager.stop)
        }
        .actionSheet(isPresented: $showingTimerList) {
            ActionSheet(title: Text("Set a timer"), message: Text("By default sound will play 15 min."), buttons: [
                .default(Text("30 minutes")) { audioManager.setTimer(loops: 1) },
                .default(Text("45 minutes")) { audioManager.setTimer(loops: 2) },
                .default(Text("1 hour")) { audioManager.setTimer(loops: 3) },
                .default(Text("2 hour")) { audioManager.setTimer(loops: 7) },
                .cancel()
            ])
        }
    }
}

#Preview {
    NavigationBarView()
        .environmentObject(AudioManager())
        .environmentObject(DataManager())
}
