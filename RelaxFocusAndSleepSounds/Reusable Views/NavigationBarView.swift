//
//  NavigationBarView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/16/24.
//

import SwiftUI

struct NavigationBarView: View {
    let title: String
    
    var body: some View {
        HStack {
            ButtonView(icon: "timer", action: {})
            ButtonView(icon: "stop.fill", action: {})
        }
    }
}

#Preview {
    NavigationBarView(title: "Sounds")
}
