//
//  SplashScreenView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 2/25/24.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        VStack {
            Image("Icon")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(20)
                .padding()
            Text("Relax, Focus And Sleep Sounds")
                .multilineTextAlignment(.center)
                .font(.title2)
                .bold()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    SplashScreenView()
}
