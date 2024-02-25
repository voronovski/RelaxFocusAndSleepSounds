//
//  ProfileView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/14/24.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        NavigationView {
            List {
                Section("Settings") {
                    HStack {
                        Image(systemName: dataManager.isListView ? "checklist.unchecked" : "square.grid.3x3.fill")
                            .foregroundStyle(.accent)
                        Picker("Display type", selection: $dataManager.isListView) {
                            Text("Grid")
                            Text("List")
                        }
                    }
                    NavigationLink(destination: AboutView()) {
                        ProfileCellView(image: "circle.lefthalf.striped.horizontal", text: "Theme")
                    }
                    NavigationLink(destination: AboutView()) {
                        ProfileCellView(image: "character.ja", text: "Language")
                    }
                }
                .headerProminence(.increased)
                
                Section("Social") {
                    NavigationLink(destination: AboutView()) {
                        ProfileCellView(image: "envelope", text: "Write to me")
                    }
                    NavigationLink(destination: AboutView()) {
                        ProfileCellView(image: "star", text: "Rate app")
                    }
                    NavigationLink(destination: AboutView()) {
                        ProfileCellView(image: "square.and.arrow.up", text: "Tell your friends")
                    }
                }
                .headerProminence(.increased)

                NavigationLink(destination: AboutView()) {
                    ProfileCellView(image: "info.circle", text: "About")
                }
            }
            .navigationTitle("Profile")
//            .listStyle(.inset)
            
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(DataManager())
}
