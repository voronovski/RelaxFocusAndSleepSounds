//
//  AboutView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 2/25/24.
//

import SwiftUI

struct AboutView: View {
    
    let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "1.0"

    
    var body: some View {
        Image("Icon")
            .resizable()
            .frame(width: 120, height: 120  )
            .cornerRadius(20)
        VStack {
            Text("App created by Alex Voronovski,")
            Text("thanks for using!")                
        }
        .font(.headline)
        .padding()
        Text("Version: \(appVersion)")
            .font(.subheadline)
    }
}

#Preview {
    AboutView()
}
