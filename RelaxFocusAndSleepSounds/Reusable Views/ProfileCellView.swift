//
//  ProfileCellView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 2/25/24.
//

import SwiftUI

struct ProfileCellView: View {
    
    var image: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundColor(.accentColor)
            Text(text)
        }
    }
}

#Preview {
    ProfileCellView(image: "info.circle", text: "About")
}
