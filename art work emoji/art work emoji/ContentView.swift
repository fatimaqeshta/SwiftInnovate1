//
//  ContentView.swift
//  art work emoji
//
//  Created by fatima qeshta on 25/09/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // This is the character
            VStack {
                HStack {
                    Text("🫵")
                        .font(.system(size:80))
                        .rotation3DEffect(
                            .degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                        .offset(x: 40)
                    
                    Text("😉")
                        .font(.system(size:240))
                    
                    Text("🤙")
                        .font(.system(size:100))
                        .offset(x: -40)
                        
                        
                }
                HStack {
                    Text("🦿")
                        .font(.system(size: 100))
                        .rotation3DEffect(
                            .degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                    Text("🦿")
                        .font(.system(size: 100))
                }
                .offset(y: -40)
            }
            
            // Sunglasses in front of the character
            Text("")
                .font(.system(size: 150))
                .offset(y: -80)
        }
    }
}

#Preview {
    ContentView()
}
