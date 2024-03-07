//
//  AboutView.swift
//  RelaxFocusAndSleepSounds
//
//  Created by Aleksei Voronovskii on 2/25/24.
//

import SwiftUI

struct AboutView: View {
    
    let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "1.0"
    
    @State private var tapCount = 0
    @State private var isImageEnlarged = false
    
    var body: some View {
        VStack {
            Image("Icon")
                .resizable()
                .frame(width: isImageEnlarged ? UIScreen.main.bounds.width - 32 : 150, height: isImageEnlarged ? UIScreen.main.bounds.width - 32 : 150)
                .cornerRadius(isImageEnlarged ? 40 : 20)
                .onTapGesture {
                    tapCount += 1
                    if tapCount == 5 {
                        withAnimation {
                            isImageEnlarged.toggle()
                        }
                        tapCount = 0
                    }
                }
            
            Text("App created by Alex Voronovski, thanks for using!")
                .multilineTextAlignment(.center)
                .font(.headline)
                .padding()
            Text("Version: \(appVersion)")
                .font(.subheadline)
        }
    }
}


#Preview {
    AboutView()
}
