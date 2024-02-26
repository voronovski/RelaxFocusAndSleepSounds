//
//  SplashScreenView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 2/25/24.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        Image("splashScreen")
            .resizable()
            .ignoresSafeArea()
    }
}

#Preview {
    SplashScreenView()
}
