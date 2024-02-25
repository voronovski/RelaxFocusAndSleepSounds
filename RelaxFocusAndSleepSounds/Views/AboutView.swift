//
//  AboutView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 2/25/24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        Image("AppImage")
            .resizable()
            .frame(width: 120, height: 120  )
            .cornerRadius(20)
        VStack {
            Text("App created by Alex Voronovski,")
            Text("thanks for using!")                
        }
        .padding()
        Text("Version: 1.0")
            .font(.subheadline)
    }
}

#Preview {
    AboutView()
}
