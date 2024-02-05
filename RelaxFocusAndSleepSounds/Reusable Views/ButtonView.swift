//
//  ButtonView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 1/15/24.
//

import SwiftUI

struct ButtonView: View {
    
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
        }
        .foregroundStyle(.red)
    }
}

#Preview {
    ButtonView(icon: "heart.fill", action: {})
}

