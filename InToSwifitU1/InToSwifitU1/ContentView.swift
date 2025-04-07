//
//  ContentView.swift
//  InToSwifitU1
//
//  Created by fatima qeshta on 07/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe.europe.africa.fill")
                .font(.system(size:150))
                .padding()
            
                .foregroundStyle(.green)
            Text("Hello lets get strated!")
                .background(.black)
                .foregroundColor(.green)
                .font(.largeTitle)
                .padding()
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
