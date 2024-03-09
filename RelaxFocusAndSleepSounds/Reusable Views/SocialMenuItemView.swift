//
//  SocialMenuItemView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 3/8/24.
//

import SwiftUI

struct SocialMenuItemView: View {
    
    let action: () -> Void
    let image: String
    let text: String
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: image)
                Text(text)
                    .foregroundStyle(.foreground)
                Spacer()
                Image(systemName: "chevron.forward")
                    .font(.system(size: UIFont.systemFontSize, weight: .semibold))
                    .foregroundStyle(.gray)
                    .opacity(0.6)
            }
        }
    }
}

#Preview {
    SocialMenuItemView(action: {}, image: "envelope", text: "Give a feedback")
}
